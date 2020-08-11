# CreateGeoLocations migration
class CreateGeoLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :geo_locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :label

      t.timestamps
    end

    add_index :geo_locations, %i[latitude longitude]
  end
end
