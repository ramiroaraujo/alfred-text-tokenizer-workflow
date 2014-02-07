#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'bundle/bundler/setup'
require 'alfred'
require_relative 'tokenizer'

query = ARGV[0]

separators_info = [
    {:key => 'comma_quote', :title => 'Join by commas, surrounded by quotes', :subtitle => 'Join values by comma, and have the values enclosed in quotes'},
    {:key => 'comma', :title => 'Join by commas', :subtitle => 'Join values by comma'},
    {:key => 'space_quote', :title => 'Join by spaces, surrounded by quotes', :subtitle => 'Join values by space, and have the values enclosed in quotes'},
    {:key => 'space', :title => 'Join by spaces', :subtitle => 'Join values by space'},
    {:key => 'newline_quote', :title => 'Join by new lines, surrounded by quotes', :subtitle => 'Join values by new lines, and have the values enclosed in quotes'},
    {:key => 'newline', :title => 'Join by new lines', :subtitle => 'Join values by new lines'},
    {:key => 'tab_quote', :title => 'Join by tabs, surrounded by quotes', :subtitle => 'Join values by tab, and have the values enclosed in quotes'},
    {:key => 'tab', :title => 'Join by tabs', :subtitle => 'Join values by tab'},
    {:key => 'semicolon_quote', :title => 'Join by semicolons, surrounded by quotes', :subtitle => 'Join values by semicolon, and have the values enclosed in quotes'},
    {:key => 'semicolon', :title => 'Join by semicolons', :subtitle => 'Join values by semicolon'},
]

# @todo remove some unused options and add a last option to specify a delimiter in a _next_ alfred operation. It should temporarily write the input text and check if existent at begining. Prompt for separator if existent, and immediately delete data, even if no action is taken.

Alfred.with_friendly_error do |alfred|
  fb = alfred.feedback

  tokenizer = Tokenizer.new

  # checks for a valid separator
  unless tokenizer.check query
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