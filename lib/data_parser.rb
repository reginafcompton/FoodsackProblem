class DataParser
  attr_reader :total, :prices_array

  def initialize(args)
    @total = args[:total]
    @prices_array = args[:prices_array]
  end

  def make_possiblity_array
    # Make an array of consecutive integers, from lowest price to target total.
    lowest_price = prices_array[0]
    price_range = []

    (total + 1 - lowest_price).times do
      price_range << lowest_price
      lowest_price += 1
    end

    price_range
  end

  def make_temp_price_array(incremented_price, price_from_menu, possibilities_array)
        num_of_items = incremented_price / price_from_menu
        container_index = incremented_price % price_from_menu
        temp_price_array = []

        num_of_items.times { temp_price_array << price_from_menu }

        temp_price_array << possibilities_array[container_index]
        temp_price_array.flatten!
  end

  def make_my_order
    # Store all price possibilities in this.
    price_possibilities = Array.new(total + 1) { [] }
    # Store all totals in this.
    totals = Array.new(total + 1) { 0 }
    # Store all solutions in this.
    all_solutions = Array.new(total + 1) { [0, []] }

    price_range = make_possiblity_array

    # Check every possibility incremente by one, beginning with the lowest price, up to the target total.
    price_range.each do |incremented_price|

      prices_array.each do |price|

        # Create an array of possible prices.
        temp_price_array = make_temp_price_array(incremented_price, price, price_possibilities)

        # Add elements in the temp_price_array.
        temp_total = temp_price_array.reduce(0, :+)

        if (incremented_price - all_solutions[incremented_price][0] > incremented_price - temp_total)
          all_solutions[incremented_price] = [temp_total, temp_price_array]
          price_possibilities[incremented_price] = [temp_price_array]
        elsif (all_solutions[incremented_price][0] == temp_total) && (all_solutions[incremented_price][1].length > temp_price_array.length)
          all_solutions[incremented_price] = [temp_total, temp_price_array]
          price_possibilities[incremented_price] = [temp_price_array]
        end

      end

    end
    all_solutions[total]
  end

end
