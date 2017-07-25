# GeoLocation model
class GeoLocation < ApplicationRecord
  has_many :stores

  validates :label, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :google_place_id, presence: true

  reverse_geocoded_by :latitude, :longitude

  def self.filtered_by(type)
    belongs_to type,
               foreign_key: :located_id,
               foreign_type: type.to_s.capitalize
    where(located_type: type.to_s.capitalize).joins(type)
  end
end
