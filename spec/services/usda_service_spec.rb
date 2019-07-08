require 'rails_helper'

describe UsdaService do
  describe "foods" do
    it "finds all foods by ingredient" do
      WebMock.disable!

      foods = UsdaService.find_foods_by_ingredient("sweet potatoes")
require 'pry'; binding.pry
      food = foods.first

      expect(foods.count).to eq(531)
      expect(food[:ndbno]).to eq("12345")
      expect(food[:name]).to eq("pie")
      expect(food[:group]).to eq("dessert")
      expect(food[:ds]).to eq("BI") #BL or SR
      expect(food[:manu]).to eq("Tyson")

    end
  end
end
