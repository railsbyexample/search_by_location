require 'rails_helper'

RSpec.describe Store, type: :model do
  it 'has a valid factory' do
    store = build :store
    expect(store).to be_valid
  end
end
