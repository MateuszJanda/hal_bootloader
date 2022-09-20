#! /usr/bin/env python3

"""
Convert HAL bash escape colors codes (256) to NASM (IBM Code page 437 colors)
representation.
"""

import re
import string


def main():
    with open("hal256.bash", "r") as f:
        for line in f:
            if '"' in line:
                continue

            line = line.strip()
            line = line.replace("\\e[m", "")
            line = line.replace("\\e", "")
            line = line.replace("m", "")
            line = line.replace("38;5;", "")
            line = line.replace("48;5;", "")
            line = line.replace("▄", "")

            output = "    db "
            pattern = re.compile(r'\[([0-9]*);([0-9]*)')
            for fg, bg in pattern.findall(line):
                if output[-1] in string.hexdigits:
                    output += ","
                fg_val = bash_color_to_bios_color(int(fg))
                bg_val = bash_color_to_bios_color(int(bg))

                output += f"0x{bg_val << 4 | fg_val:02x}"

            print(output)

def bash_color_to_bios_color(val):
    """
    https://en.wikipedia.org/wiki/BIOS_color_attributes
    https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit
    """

    if val == 1:
        return 0x00
    elif val == 7:
        return 0x07
    elif val == 8:
        return 0x08
    elif val in [52, 88, 124]:
        return 0x04
    elif val in [59, 95]:
        return 0x06
    elif val in [102, 145]:
        return 0x03
    elif val in [160, 166]:
        return 0x0c
    elif val == 188:
        return 0x07
    elif val == 227:
        return 0x0e
    elif 232 <= val < 238:
        return 0x00
    elif 238 <= val < 244:
        return 0x08
    elif 244 <= val < 250:
        return 0x07
    elif 250 <= val < 256:
        return 0x0f
    else:
        raise Exception("Not supported color:", val)



if __name__ == '__main__':
    main()