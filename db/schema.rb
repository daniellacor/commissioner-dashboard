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

ActiveRecord::Schema.define(version: 20160606141259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "commissioners", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
  end

  create_table "dues", force: :cascade do |t|
    t.integer "amount"
    t.integer "league_id"
    t.integer "manager_id"
    t.integer "commissioner_id"
    t.boolean "paid",            default: false
  end

  create_table "leagues", force: :cascade do |t|
    t.integer  "commissioner_id"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "league_id"
  end

end
