class DataParser
  attr_reader :total, :prices_array

  def initialize(args)
    @total = args[:total]
    @prices_array = args[:prices_array]
  end

  def make_my_order(prices_array, total)
    # Store all price possibilities in this.
    price_possibilities = Array.new(total + 1) { [] }
    # Store all totals in this.
    totals = Array.new(total + 1) { 0 }

    # Store all solutions in this.
    all_solutions = Array.new(total + 1) { [0, []] }
  end

end