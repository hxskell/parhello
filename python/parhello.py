#!/usr/bin/env python

import pp
import sys

def main():
	server = pp.Server()

	for c in "Hello World!\n":
		server.submit(sys.stdout.write, (c,), (), ("sys",))()

if __name__=="__main__":
	main()