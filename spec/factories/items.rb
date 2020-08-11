FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "MyString-#{n}" }
    description { 'MyText' }
    store { create :store }
  end
end
