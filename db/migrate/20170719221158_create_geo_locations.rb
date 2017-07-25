# CreateGeoLocations migration
class CreateGeoLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :geo_locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :label
      t.string :google_place_id
      t.json :google_address_components

      t.timestamps
    end

    add_index :geo_locations, %i[latitude longitude]
  end
end
