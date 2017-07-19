# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170719221755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "geo_locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "label"
    t.string "google_place_id"
    t.string "located_type"
    t.bigint "located_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latitude", "longitude"], name: "index_geo_locations_on_latitude_and_longitude"
    t.index ["located_type", "located_id"], name: "index_geo_locations_on_located_type_and_located_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_stores_on_seller_id"
  end

  add_foreign_key "items", "stores"
  add_foreign_key "stores", "sellers"
end
