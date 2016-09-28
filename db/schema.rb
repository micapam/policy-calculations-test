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

ActiveRecord::Schema.define(version: 20160928003258) do

  create_table "age_brackets", force: :cascade do |t|
    t.integer  "min"
    t.integer  "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "cost"
    t.integer  "age_bracket_id"
    t.integer  "trip_duration_bracket_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["age_bracket_id"], name: "index_prices_on_age_bracket_id"
    t.index ["trip_duration_bracket_id"], name: "index_prices_on_trip_duration_bracket_id"
  end

  create_table "trip_duration_brackets", force: :cascade do |t|
    t.integer  "min"
    t.integer  "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
