class UsdaFacade

  def initialize(params)
    @query = params
  end

  def search_results
    usda_service.find_foods_by_ingredient(@query).take(10).map do |search_result|
      SearchResult.new(search_result)
    end
  end

  private

  def usda_service
    UsdaService.new
  end

end
