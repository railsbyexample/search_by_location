FactoryBot.define do
  factory :item do
    name { 'MyString' }
    description { 'MyText' }
    store { create :store }
  end
end
