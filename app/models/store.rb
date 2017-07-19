# Store model
class Store < ApplicationRecord
  belongs_to :seller
  has_one :geo_location, as: :located
end
