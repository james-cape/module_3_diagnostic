class UsdaService

  def self.find_foods_by_ingredient(ingredient)
    get_json('/ndb/search', q: "#{ingredient}")
  end

  private
  def get_json(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end


  def conn
    Faraday.new(url: 'api.nal.usda.gov') do |f|
      f.params['api_key'] = 'API_KEY'
      f.adapter Faraday.default_adapter
    end
  end
end
