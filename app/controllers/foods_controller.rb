class FoodsController < ApplicationController
  def index
    render json: UsdaService.new(Food.all)
  end
end
