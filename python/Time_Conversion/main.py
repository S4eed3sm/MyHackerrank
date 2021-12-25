#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'timeConversion' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#


def timeConversion(s: str):
    t, am_pm = s[:-2], s[-2:]
    hh, rest = t.split(":", 1)
    hh = int(hh) % 12
    if am_pm == "AM":
        hh += 0
    else:
        hh += 12
    return "%02d:"%hh + rest


if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    s = input()

    result = timeConversion(s)

    fptr.write(result + '\n')

    fptr.close()
