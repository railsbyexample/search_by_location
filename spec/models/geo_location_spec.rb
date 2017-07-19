require 'rails_helper'

RSpec.describe GeoLocation, type: :model do
  it 'has a valid factory' do
    geo_location = build :geo_location
    expect(geo_location).to be_valid
  end

  describe 'validations' do
    it 'should be invalid with a missing attribute' do
      geo_location = build :geo_location, latitude: nil
      expect(geo_location).to be_invalid
    end

    it 'should be valid with all attributes' do
      geo_location = build :geo_location
      expect(geo_location).to be_valid
    end
  end

  describe 'associations' do
    it 'should belong to a store (polymorphic)' do
      geo_location = create :geo_location

      store = create :store, geo_location: geo_location

      expect(geo_location.located).to eq(store)
    end
  end
end
