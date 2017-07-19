require 'rails_helper'

RSpec.describe Seller, type: :model do
  it 'has a valid factory' do
    seller = build :seller
    expect(seller).to be_valid
  end
end
