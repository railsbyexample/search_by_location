# CreateItems migration
class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name, limit: 50
      t.text :description, limit: 500
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
