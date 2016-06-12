require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative '../config/variables.rb'

class DataRetriever

  def self.write_file
    doc = Nokogiri::HTML(open(URL))
    File.write(CSV_FILE_PATH, doc.text)
  end

  def self.find_max_amount
    max_amount = CSV.open(CSV_FILE_PATH, 'r') { |csv_line| csv_line.first[0][1..-1] }
  end

  def self.make_data_hash
    menu_items_hash = Hash.new

    CSV.foreach(CSV_FILE_PATH, :headers => true) do |csv_line|
      # Add items to hash. Remove $.
      menu_items_hash[csv_line[0]] = csv_line[1][1..-1]
    end

    menu_items_hash
  end

  def self.make_data_array
    menu_items_array = Array.new

    CSV.foreach(CSV_FILE_PATH, :headers => true) do |csv_line|
      menu_items_array << csv_line[1][1..-1]
    end

    menu_items_array
  end

end