# Item model
class Item < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, presence: true

  # Associations
  belongs_to :store

  # Scopes
  scope :near, (lambda do |location, distance|
    Item.includes(store: :geo_location)
        .references(:geo_location)
        .merge(GeoLocation.near(location, distance))
  end)
end
