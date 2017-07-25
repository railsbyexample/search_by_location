# Store model
class Store < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, presence: true

  # Associations
  belongs_to :seller
  belongs_to :geo_location
  has_many :items, dependent: :destroy
end
