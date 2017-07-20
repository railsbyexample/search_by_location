require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'has a valid factory' do
    item = build :item
    expect(item).to be_valid
  end

  describe 'validations' do
    it 'should be invalid if an attribute is missing' do
      item = build :item, description: ''
      expect(item).to be_invalid
    end

    it 'should be valid with all attributes' do
      item = build :item
      expect(item).to be_valid
    end
  end

  describe 'associations' do
    it 'should belong to a store' do
      store = create :store
      item = create :item, store: store

      expect(item.store).to eq(store)
    end
  end

  describe 'geocoder' do
    it 'should accept near query' do
      # Add some known locations
      new_york = create :geo_location,
                        label: 'New York',
                        latitude: 40.7127837,
                        longitude: -74.00594130000002
      # Los Angeles
      los_angeles = create :geo_location,
                           label: 'Los Angeles',
                           latitude: 34.0522342,
                           longitude: -118.2436849
      # Philadelphia
      philly = [39.9525839, -75.16522150000003]
      # Add some records (NY and LA)
      new_york_items = create_list :item, 5,
                                   store: create(:store, geo_location: new_york)
      create_list :item, 5, store: create(:store, geo_location: los_angeles)

      near_philly = Item.near(philly, 100)

      expect(near_philly.map(&:id).sort)
        .to eq(new_york_items.map(&:id).sort)
    end
  end
end
