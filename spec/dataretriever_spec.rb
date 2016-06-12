require_relative '../lib/DataRetriever.rb'

describe DataRetriever do
  let(:menu_retriever) { DataRetriever }
  let(:menu) { menu_retriever.make_data_hash }

  describe "find_max_amount" do
    it 'returns the csv header' do
      expect(menu_retriever.find_max_amount).to eq("15.05")
    end
  end

  describe "make_data_hash" do
    it 'returns a hash' do
      expect(menu).to be_a Hash
    end

    it 'returns a hash with food items as keys' do
      expect(menu.first[0]).to eq("mixed fruit")
    end

    it 'returns a hash with prices as values' do
      expect(menu.first[1]).to eq("2.15")
    end
  end

end