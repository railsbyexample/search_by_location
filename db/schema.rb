# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2017_07_19_221755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "geo_locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latitude", "longitude"], name: "index_geo_locations_on_latitude_and_longitude"
  end

  create_table "items", force: :cascade do |t|
    t.string "name", limit: 50
    t.text "description"
    t.bigint "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_items_on_store_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name", limit: 50
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", limit: 50
    t.text "description"
    t.bigint "seller_id"
    t.bigint "geo_location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geo_location_id"], name: "index_stores_on_geo_location_id"
    t.index ["seller_id"], name: "index_stores_on_seller_id"
  end

  add_foreign_key "items", "stores"
  add_foreign_key "stores", "geo_locations"
  add_foreign_key "stores", "sellers"
end
