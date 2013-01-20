#!/usr/bin/env ruby

require "rubygems"
require "parallel"

def main
	Parallel.map("Hello World!\n") { |c| putc c }
end

main if __FILE__ == $0