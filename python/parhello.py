#!/usr/bin/env python

import multiprocessing
import sys

def hello(c):
  sys.stdout.write(c)

def main():
  p = multiprocessing.Pool()
  p.map(hello, "Hello World!\n")

if __name__ == "__main__":
  main()
