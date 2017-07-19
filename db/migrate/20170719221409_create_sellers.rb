# CreateSellers migration
class CreateSellers < ActiveRecord::Migration[5.1]
  def change
    create_table :sellers do |t|
      t.string :name, limit: 50
      t.text :description, limit: 500

      t.timestamps
    end
  end
end
