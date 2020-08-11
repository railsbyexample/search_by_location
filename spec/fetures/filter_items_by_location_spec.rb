require 'rails_helper'

RSpec.describe 'FilterItemsByLocation', type: :feature do
  let!(:new_york) { create :geo_location, :new_york }
  let!(:los_angeles) { create :geo_location, :los_angeles }
  let!(:philly) { create :geo_location, :philly }

  let!(:new_york_items) do
    create_list :item, 5, store: create(:store, geo_location: new_york)
  end

  let!(:los_angeles_items) do
    create_list :item, 5, store: create(:store, geo_location: los_angeles)
  end

  it 'shows results "near" Philadelphia (New York)' do
    visit items_path

    select philly.label, from: 'geo_location_id'
    fill_in 'distance', with: '100'

    click_on 'Find'

    new_york_items.each do |item|
      expect(page).to have_content(item.name)
    end
  end

  it 'doesn\'t show results not "near" Philadelphia (Los Angeles)' do
    visit items_path

    select philly.label, from: 'geo_location_id'
    fill_in 'distance', with: '100'

    click_on 'Find'

    los_angeles_items.each do |item|
      expect(page).not_to have_content(item.name)
    end
  end
end
