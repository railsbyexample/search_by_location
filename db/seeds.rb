require 'faker'
require_relative './seeds/goog_places'

20.times do
  Seller.create!(
    name: Faker::Company.name,
    description: Faker::Lorem.paragraph.truncate(500)
  )
end

GOOG_PLACES.each { |goog_place| GeoLocation.create!(goog_place) }

Seller.all.each do |seller|
  rand(1..5).times do
    Store.create!(
      seller: seller,
      name: Faker::Address.street_name,
      description: Faker::Lorem.paragraph.truncate(500),
      geo_location: GeoLocation.order('RANDOM()').first
    )
  end
end

Store.all.each do |store|
  rand(1..5).times do
    Item.create!(
      store: store,
      name: "#{Faker::Appliance.brand} #{Faker::Appliance.equipment}",
      description: Faker::Lorem.paragraph.truncate(500)
    )
  end
end
