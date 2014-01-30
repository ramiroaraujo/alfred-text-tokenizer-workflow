#!/usr/bin/env ruby
# encoding: utf-8

require "bundle/bundler/setup"
require "alfred"
require "tokenizer"

query = ARGV[0]

separators_info = [
    {:key => 'comma_quote', :title => 'Tokenize by commas, surrounded by quotes', :subtitle => 'Separate values by comma, and have the values enclosed in quotes'},
    {:key => 'comma', :title => 'Tokenize by commas', :subtitle => 'Separate values by comma'},
    {:key => 'space_quote', :title => 'Tokenize by spaces, surrounded by quotes', :subtitle => 'Separate values by space, and have the values enclosed in quotes'},
    {:key => 'space', :title => 'Tokenize by spaces', :subtitle => 'Separate values by space'},
    {:key => 'newline_quote', :title => 'Tokenize by new lines, surrounded by quotes', :subtitle => 'Separate values by new lines, and have the values enclosed in quotes'},
    {:key => 'newline', :title => 'Tokenize by new lines', :subtitle => 'Separate values by new lines'},
    {:key => 'tab_quote', :title => 'Tokenize by tabs, surrounded by quotes', :subtitle => 'Separate values by tab, and have the values enclosed in quotes'},
    {:key => 'tab', :title => 'Tokenize by tabs', :subtitle => 'Separate values by tab'},
    {:key => 'semicolon_quote', :title => 'Tokenize by semicolons, surrounded by quotes', :subtitle => 'Separate values by semicolon, and have the values enclosed in quotes'},
    {:key => 'semicolon', :title => 'Tokenize by semicolons', :subtitle => 'Separate values by semicolon'},
]

Alfred.with_friendly_error do |alfred|
  fb = alfred.feedback

  tokenizer = Tokenizer.new

  # checks for a valid separator
  if !tokenizer.check query
    fb.add_item({
                    :uid => '',
                    :title => 'No separator or enough data detected',
                    :arg => '',
                    :valid => 'no',
                })

    puts fb.to_xml()
    exit
  end

  separators_info.each do |value|
    fb.add_item({
                    :uid => '',
                    :title => value[:title],
                    :subtitle => value[:subtitle],
                    :arg => "#{value[:key]}|#{query}",
                    :valid => 'yes',
                })
  end

  puts fb.to_xml()
end