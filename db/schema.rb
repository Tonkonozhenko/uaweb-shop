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

ActiveRecord::Schema.define(version: 20141028203804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "items", force: true do |t|
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.integer  "price"
    t.integer  "views",              default: 0
    t.hstore   "bought_with_this",   default: ""
    t.hstore   "carted_with_this",   default: ""
    t.hstore   "viewed_with_this",   default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "count",      default: 1
    t.integer  "each_price", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "session_id"
    t.string   "buyer_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["session_id"], name: "index_orders_on_session_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id"
    t.integer  "viewed",     default: [], array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
