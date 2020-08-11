FactoryBot.define do
  factory :geo_location do
    latitude { 1.5 }
    longitude { 1.5 }
    label { 'Caracas' }

    trait :new_york do
      label { 'New York' }
      latitude { 40.7127837 }
      longitude { -74.00594130000002 }
    end

    trait :los_angeles do
      label { 'Los Angeles' }
      latitude { 34.0522342 }
      longitude { -118.2436849 }
    end

    trait :philly do
      label { 'Philadelphia' }
      latitude { 39.9525839 }
      longitude { -75.16522150000003 }
    end
  end
end
