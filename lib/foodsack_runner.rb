require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative '../config/variables.rb'
require_relative 'data_parser.rb'
require_relative 'data_retriever.rb'


par = DataParser.new(total: 1505, prices_array: [215,275, 335, 355, 420, 580] )
p par.make_my_order