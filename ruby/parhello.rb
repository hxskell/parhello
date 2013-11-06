#!/usr/bin/env ruby

require "rubygems"
require "parallel"

Parallel.map("Hello World!\n".split("")) { |c| putc c }
