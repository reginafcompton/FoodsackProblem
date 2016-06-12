# Unsuccessful "greedy" solution....
# def find_order(amount, prices)
#       reverse_arr = prices.sort
#       # sorted_items = menu_items.sort_by {|_key, value| value.to_i }.to_h
#       array = []
#       # sorted_items.each do |item_name, item_price|
#       #   price = item_price.to_f
#       #   amount = amount.to_f
#       #   this = amount/price
#       #   amount %= price
#       #   this.to_i.times { array << price }
#       # end

#       reverse_arr.each do |coin|
#         this = amount/coin
#         amount %= coin
#         this.times { array << coin }
#       end
#       array
# end