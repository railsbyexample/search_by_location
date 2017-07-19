# GeoLocation model
class GeoLocation < ApplicationRecord
  belongs_to :located, polymorphic: true

  validates :label, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :google_place_id, presence: true
end
