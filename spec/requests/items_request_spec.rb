require 'rails_helper'

RSpec.describe 'Items', type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      get items_url
      expect(response).to be_successful
    end

    describe 'with given location params' do
      let(:new_york) { create :geo_location, :new_york }
      let(:los_angeles) { create :geo_location, :los_angeles }
      let(:philly) { create :geo_location, :philly }

      before(:each) do
        create_list :item, 5, store: create(:store, geo_location: new_york)
        create_list :item, 5, store: create(:store, geo_location: los_angeles)
      end

      it 'filters the collection by location' do
        get items_url, params: { geo_location_id: philly.id, distance: 100 }
        expect(response).to be_successful
      end
    end
  end
end
