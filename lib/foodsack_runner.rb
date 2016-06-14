require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative '../config/variables.rb'
require_relative 'data_parser.rb'
require_relative 'data_retriever.rb'

#DataRetriever.write_file
target_total = DataRetriever.find_max_amount
prices_array = DataRetriever.make_data_array

parse_it = DataParser.new(total: target_total, prices_array: prices_array)
p parse_it.make_my_order