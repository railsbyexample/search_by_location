FactoryGirl.define do
  factory :store do
    name 'MyString'
    description 'MyText'
    seller { create :seller }
  end
end
