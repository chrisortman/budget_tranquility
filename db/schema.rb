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

ActiveRecord::Schema.define(version: 20140121040454) do

  create_table "envelopes", force: true do |t|
    t.string   "label"
    t.decimal  "per_month"
    t.decimal  "per_check"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "recurring_transactions", force: true do |t|
    t.string   "description"
    t.decimal  "amount"
    t.string   "schedule_type"
    t.string   "schedule_json"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "transaction_type"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "widgets", force: true do |t|
    t.string   "title"
    t.integer  "quantity"
    t.decimal  "price"
    t.boolean  "sellable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
