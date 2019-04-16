#!/usr/bin/env ruby

require 'csv'
require_relative 'lib/cable_parser'

# cat заявка.csv | main

CSV.parse($stdin.read) do |row|
  p CableParser.new(row.join).response
end
