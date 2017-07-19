# CreateStores migration
class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name, limit: 50
      t.text :description, limit: 500
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
