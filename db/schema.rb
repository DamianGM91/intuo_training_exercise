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

ActiveRecord::Schema.define(version: 2019_10_11_112816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.string "type"
    t.integer "fridge_id"
    t.date "expiration_date"
    t.string "brand"
    t.decimal "volume", precision: 3, scale: 1
    t.string "size"
    t.string "color"
  end

  create_table "fridges", force: :cascade do |t|
    t.integer "owner_id"
    t.string "brand"
    t.date "last_technical_check"
  end

  create_table "pets", force: :cascade do |t|
    t.string "type"
    t.integer "owner_id"
    t.string "name"
    t.integer "age"
    t.string "favorite_food"
    t.date "date_of_death"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.date "date_of_birth"
    t.integer "pet_count"
    t.integer "fridge_id"
  end

  add_foreign_key "foods", "fridges"
  add_foreign_key "fridges", "users", column: "owner_id"
  add_foreign_key "pets", "users", column: "owner_id"
end
