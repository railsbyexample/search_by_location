require 'faker'
require_relative './seeds/sample_data'

ActiveRecord::Base.transaction do
  sellers = SELLERS.map do |seller|
    Seller.create!(name: seller, description: Faker::Lorem.paragraph.truncate(500))
  end

  geo_locations = GEO_LOCATIONS.map do |geo_location|
    GeoLocation.create!(geo_location)
  end

  geo_locations.each do |geo_location|
    sellers.sample(rand(3..5)).each do |seller|
      Store.create!(
        seller: seller,
        name: geo_location.label,
        description: Faker::Lorem.paragraph.truncate(500),
        geo_location: geo_location
      )
    end
  end

  Store.all.each do |store|
    ITEMS.sample(rand(1..5)).each do |item|
      Item.create!(
        store: store,
        name: item,
        description: Faker::Lorem.paragraph.truncate(500)
      )
    end
  end
end
