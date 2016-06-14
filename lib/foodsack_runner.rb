require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative '../config/variables.rb'
require_relative 'data_parser.rb'
require_relative 'data_retriever.rb'

retrieve_it = DataRetriever.new
# retrieve_it.write_file
target_total = retrieve_it.find_max_amount
prices_array = retrieve_it.make_data_array

parse_it = DataParser.new(total: target_total, prices_array: prices_array)
p parse_it.make_my_order