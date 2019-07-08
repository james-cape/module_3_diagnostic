require 'rails_helper'

describe UsdaService do
  describe "foods" do
    it "finds all foods by ingredient" do
      # WebMock.disable!
      VCR.use_cassette("services/find_foods") do
        foods = UsdaService.find_foods_by_ingredient("sweet potatoes")

        food = foods.first

        expect(foods.count).to eq(150)
        expect(food[:ndbno]).to eq("45094945")
        expect(food[:name]).to eq("ONE POTATO TWO POTATO, PLAIN JAYNES, SWEET POTATO CHIPS, UPC: 785654000544")
        expect(food[:group]).to eq("Branded Food Products Database")
        expect(food[:ds]).to eq("LI")
        expect(food[:manu]).to eq("Dieffenbach's Potato Chips")
      end
    end
  end
end
