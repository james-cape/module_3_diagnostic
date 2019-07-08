# class UsdaService
#   include FastJsonapi::ObjectSerializer
#   attributes :id, :ndbno, :name, :group, :ds, :manu
#
#   def find_foods_by_ingredient(ingredient)
#     get_json('/ndb/search', q: "#{ingredient}")
#   end
#
#   private
#
#   def get_json(url, params)
#     response = conn.get(url, params)
#     JSON.parse(response.body, symbolize_names: true)
#   end
#
#   def conn
#     Faraday.new(url: 'api.nal.usda.gov') do |f|
#       f.params['api_key'] = 'API_KEY'
#       f.adapter Faraday.default_adapter
#     end
#   end
# end


class UsdaService

  def initialize(ingredient)
    @ingredient = ingredient
    @conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
      faraday.headers["API_Key"] = ENV["API_KEY"]
      faraday.adapter  Faraday.default_adapter
    end
  end

  def find_foods_by_ingredient
    # ndb/search/?format=json&q=butter&sort=n&max=25&offset=0&api_key=DEMO_KEY
    # get_url("/?=#{@ingredient}&sort=n&max=25&offset=0&api_key=#{ENV['API_KEY']}")
    get_url("ndb/search/?p=#{@ingredient}&api_key=#{ENV['API_KEY']}")
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:list][:item]
  end

  def self.find_foods_by_ingredient(ingredient)
    new(ingredient).find_foods_by_ingredient
  end
end
