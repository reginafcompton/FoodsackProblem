class DataParser
  attr_reader :total, :prices_array

  def initialize(args)
    @total = args[:total]
    @prices_array = args[:prices_array]
  end

end