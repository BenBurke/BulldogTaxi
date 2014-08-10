# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140810163441) do

  create_table "airports", force: true do |t|
    t.string   "name"
    t.integer  "carrier_id"
    t.integer  "trip_id"
    t.integer  "flight_id"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cab_rides", force: true do |t|
    t.integer  "trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carriers", force: true do |t|
    t.string   "name"
    t.integer  "airport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colleges", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flights", force: true do |t|
    t.string   "flight_number"
    t.integer  "carrier_id"
    t.string   "departure_airport"
    t.integer  "departure_airport_id"
    t.string   "arrival_airport"
    t.integer  "arrival_airport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "arrival_datetime"
    t.datetime "departure_datetime"
    t.integer  "trip_id"
    t.string   "carrier_name"
    t.string   "arrival_date"
    t.string   "arrival_time"
  end

  add_index "flights", ["trip_id"], name: "index_flights_on_trip_id"

  create_table "trips", force: true do |t|
    t.integer  "cab_ride_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "payment_status", default: false
    t.string   "confirmation"
    t.integer  "flight_id"
    t.string   "flight_number"
    t.string   "arrival_date"
    t.string   "arrival_time"
  end

  add_index "trips", ["cab_ride_id"], name: "index_trips_on_cab_ride_id"
  add_index "trips", ["user_id"], name: "index_trips_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "college"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "netid"
    t.string   "image"
    t.string   "promo_code"
    t.integer  "parent_id"
    t.integer  "tokens",       default: 0
    t.integer  "trip_count",   default: 0
    t.string   "phone_number"
    t.string   "fname"
    t.string   "lname"
    t.integer  "college_id"
  end

  add_index "users", ["parent_id"], name: "index_users_on_parent_id"

end
