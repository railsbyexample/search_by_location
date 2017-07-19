require 'rails_helper'

RSpec.describe Seller, type: :model do
  it 'has a valid factory' do
    seller = build :seller
    expect(seller).to be_valid
  end

  describe 'validations' do
    it 'should be invalid if an attribute is missing' do
      seller = build :seller, description: ''
      expect(seller).to be_invalid
    end

    it 'should be valid with all attributes' do
      seller = build :seller
      expect(seller).to be_valid
    end
  end

  describe 'associations' do
    it 'should have many stores' do
      seller = create :seller
      stores = create_list :store, 5, seller: seller

      expect(seller.stores).to eq(stores)
    end
  end
end
