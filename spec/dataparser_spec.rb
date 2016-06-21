require_relative '../lib/data_parser.rb'

describe DataParser do
  let(:menu_parser) { DataParser.new(total: 1505, prices_array: [215,275, 335, 355, 420, 580] ) }
  let(:price_range) { menu_parser.make_possiblity_array }

  describe "#make_possiblity_array" do
    it 'returns an array' do
      expect(price_range).to be_a Array
    end

    it 'returns an array that includes the lowest menu price at index 0' do
      expect(price_range[0]).to eq(menu_parser.prices_array[0])
    end

    it 'returns an array as long as the target total less the lowest price plus one' do
      expect(price_range.length).to eq((menu_parser.total - price_range[0] + 1))
    end
  end

  describe '#make_my_order' do
    it 'returns a nested array' do
      expect(menu_parser.make_my_order[1]).to be_a Array
    end

    it 'returns an array in which the 0 index is the target total' do
      expect(menu_parser.make_my_order[0]).to eq(menu_parser.total)
    end
  end

end