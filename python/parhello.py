#!/usr/bin/env python

import pp
import sys

def hello(c):
	sys.stdout.write(c)

def main():
	server = pp.Server()

	for c in "Hello World!\n":
		server.submit(hello, (c,), (), ("sys",))()

if __name__=="__main__":
	main()
