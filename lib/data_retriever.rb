class DataRetriever

  def write_file
    doc = Nokogiri::HTML(open(URL))
    File.write(CSV_FILE_PATH, doc.text)
  end

  def find_max_amount
    max_amount = CSV.open(CSV_FILE_PATH, 'r') do |csv_line|
      price = csv_line.first[0][1..-1]
      make_integer(price)
    end
  end

  def make_data_hash
    menu_items_hash = Hash.new

    CSV.foreach(CSV_FILE_PATH, :headers => true) do |csv_line|
      # Remove $. Make integer.
      price = make_integer(csv_line[1][1..-1])

      # Add items to hash.
      menu_items_hash[csv_line[0]] = price
    end

    menu_items_hash
  end

  def make_data_array
    menu_items_array = Array.new

    CSV.foreach(CSV_FILE_PATH, :headers => true) do |csv_line|
      price = csv_line[1][1..-1]
      menu_items_array << make_integer(price)
    end

    menu_items_array.sort
  end

  def make_integer(string)
    (string.to_f * 100).to_i
  end

end