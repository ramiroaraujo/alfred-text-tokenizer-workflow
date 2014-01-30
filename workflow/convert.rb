#!/usr/bin/env ruby
# encoding: utf-8
require_relative 'tokenizer'

query = ARGV[0]

operation, query = query.split '|'

tokenizer = Tokenizer.new
print tokenizer.separate(query).join(operation)
