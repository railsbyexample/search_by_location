# GeoLocation model
class GeoLocation < ApplicationRecord
  has_many :stores

  validates :label, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :google_place_id, presence: true, uniqueness: true

  reverse_geocoded_by :latitude, :longitude
end
