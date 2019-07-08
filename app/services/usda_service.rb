class UsdaService

  def initialize(ingredient)
    @ingredient = ingredient
    @conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.headers["API_Key"] = ENV["API_KEY"]
      faraday.adapter  Faraday.default_adapter
    end
  end

  def find_foods_by_ingredient
    get_url("ndb/search/?format=json&q=#{@ingredient}&api_key=#{ENV['API_KEY']}")
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:list][:item]
  end

  def self.find_foods_by_ingredient(ingredient)
    new(ingredient).find_foods_by_ingredient
  end
end
