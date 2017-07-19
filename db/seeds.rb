require 'faker'
require_relative './seeds/goog_places'

5.times do
  Seller.create(
    name: Faker::Lorem.sentence.truncate(50),
    description: Faker::Lorem.paragraph.truncate(500)
  )
end

Seller.all.each do |seller|
  rand(1..5).times do
    Store.create(
      seller: seller,
      name: Faker::Lorem.sentence.truncate(50),
      description: Faker::Lorem.paragraph.truncate(500),
      geo_location: GeoLocation.create(GOOG_PLACES.sample)
    )
  end
end

Store.all.each do |store|
  rand(1..5).times do
    Item.create(
      store: store,
      name: Faker::Lorem.sentence.truncate(50),
      description: Faker::Lorem.paragraph.truncate(500)
    )
  end
end
