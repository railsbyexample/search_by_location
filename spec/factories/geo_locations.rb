FactoryGirl.define do
  factory :geo_location do
    latitude 1.5
    longitude 1.5
    label 'MyString'
    google_place_id 'MyString'
    located { create :store }
  end
end
