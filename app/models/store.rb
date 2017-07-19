# Store model
class Store < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, presence: true

  # Associations
  belongs_to :seller
  has_one :geo_location, as: :located
end
