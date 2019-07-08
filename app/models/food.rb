class Food < ApplicationRecord
  def initialize(attributes = {})
    @ndbno = attributes[:ndbno]
    @name = attributes[:name]
    @group = attributes[:group]
    @ds = attributes[:ds]
    @manu = attributes[:manu]
  end
end
