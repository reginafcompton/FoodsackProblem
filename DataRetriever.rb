require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative 'variables.rb'

class DataWriter

  def self.write_file
    doc = Nokogiri::HTML(open(URL))
    File.write(CSV_FILE_PATH, doc.text)
  end

end