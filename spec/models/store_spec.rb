require 'rails_helper'

RSpec.describe Store, type: :model do
  it 'has a valid factory' do
    store = build :store
    expect(store).to be_valid
  end

  describe 'validations' do
    it 'should be invalid if an attribute is missing' do
      store = build :store, description: ''
      expect(store).to be_invalid
    end

    it 'should be valid with all attributes' do
      store = build :store
      expect(store).to be_valid
    end
  end

  describe 'associations' do
    it 'should have a seller' do
      seller = create :seller
      store = create :store, seller: seller

      expect(store.seller).to eq(seller)
    end

    it 'should have a geo_location' do
      geo_location = create :geo_location
      store = create :store, geo_location: geo_location

      expect(store.geo_location).to eq(geo_location)
    end

    it 'should have many items' do
      store = create :store
      items = create_list :item, 5, store: store

      expect(store.items).to eq(items)
    end
  end
end
