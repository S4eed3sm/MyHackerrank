#!/bin/python3

import math
import os
import random
import re
import sys
from functools import reduce

#
# Complete the 'plusMinus' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#


def opr(v, x):
    if x == 0:
        v[0] += 1
    else:
        v[x/abs(x)] += 1
    return v


def plusMinus(arr):
    m = reduce(opr, arr, {1: 0, -1: 0, 0: 0})
    for v in m.values():
        print("%.06f" % (v/len(arr)))


if __name__ == '__main__':
    n = int(input().strip())

    arr = list(map(int, input().rstrip().split()))

    plusMinus(arr)
