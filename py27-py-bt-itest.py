#!/usr/bin/env python
import time

def level3():
    while True:
        level3="level3"
        time.sleep(1)


def level2():
    level3()


def level1():
    level2()


if __name__ == '__main__':
    level1()
