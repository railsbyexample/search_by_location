FactoryGirl.define do
  factory :store do
    name 'MyString'
    description 'MyText'
    seller { create :seller }
    geo_location { create :geo_location }
  end
end
