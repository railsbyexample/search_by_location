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
    it 'should have many stores' do
      geo_location = create :geo_location

      store = create :store, geo_location: geo_location

      expect(geo_location.stores.first).to eq(store)
    end
  end

  describe 'geocoder' do
    it 'should accept near query' do
      gl = GeoLocation.near([40.7127837, -74.00594130000002], 100)
      expect(gl).to be_truthy
    end
  end
end
