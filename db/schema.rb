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

ActiveRecord::Schema.define(version: 20170821131810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cartproducts", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "productcount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "restaurant_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.integer  "line_no"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuisines", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
    t.string   "password_digest"
  end

  create_table "postcodelatlngs", force: :cascade do |t|
    t.string   "postcode"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "line_no"
    t.float    "price"
    t.integer  "category_id"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurant_cuisines", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cuisine_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.decimal  "rating_point"
    t.decimal  "rating_count"
    t.integer  "open_time"
    t.integer  "close_time"
    t.string   "post_code"
    t.float    "lat"
    t.float    "lng"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "open_time_minute"
    t.integer  "close_time_minute"
    t.string   "logo"
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

end
