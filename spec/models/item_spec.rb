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

  describe 'geocoder', :focus do
    let!(:new_york) { create :geo_location, :new_york }
    let!(:los_angeles) { create :geo_location, :los_angeles }
    let!(:philly) { create :geo_location, :philly }

    let!(:new_york_items) { create_list :item, 5, store: create(:store, geo_location: new_york) }
    let!(:la_items) { create_list :item, 5, store: create(:store, geo_location: los_angeles) }

    let!(:sample_name) { 'sample_name' }
    let!(:la_items_w_name) { create_list :item, 5, name: sample_name, store: create(:store, geo_location: los_angeles) }

    it 'should accept near query' do
      near_philly = Item.near(philly, 100)
      expect(near_philly.map(&:id).sort)
        .to eq(new_york_items.map(&:id).sort)
    end

    it 'should be chainable' do
      items = Item.near(los_angeles, 100).where(name: sample_name)
      expect(items.map(&:id).sort).to eq(la_items_w_name.map(&:id).sort)
    end
  end
end
