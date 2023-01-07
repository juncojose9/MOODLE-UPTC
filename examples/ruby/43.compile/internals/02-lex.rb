#!/usr/bin/env ruby
require 'ripper'
require 'pp'

code = <<STR
puts 2 + n
STR

puts code
pp Ripper.lex(code)
