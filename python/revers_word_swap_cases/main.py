#!/bin/python3

import math
import os
import random
import re
import sys



#
# Complete the 'reverse_words_order_and_swap_cases' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING sentence as parameter.
#

def swap_cases(word: str):
    word = list(word)
    word = list(map(lambda x: x.upper() if x.islower() else x.lower(), word))
    return ''.join(word)

def reverse_words_order_and_swap_cases(sentence: str):
    words = sentence.split(" ")[::-1]
    for i in range(len(words)):
        words[i] = swap_cases(words[i])
    return " ".join(words)

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    sentence = input()

    result = reverse_words_order_and_swap_cases(sentence)

    fptr.write(result + '\n')

    fptr.close()
