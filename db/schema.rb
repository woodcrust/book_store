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

ActiveRecord::Schema.define(version: 20160609101708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", force: :cascade do |t|
    t.integer "author_id"
    t.integer "book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "price"
    t.integer  "amount"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "cover"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "points"
    t.integer  "user_id"
    t.integer  "book_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "theme"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "shopping_cart_billing_addresses", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "street"
    t.string  "city"
    t.integer "country_id"
    t.string  "zip"
    t.string  "phone"
    t.integer "user_id"
  end

  create_table "shopping_cart_countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "shopping_cart_coupons", force: :cascade do |t|
    t.integer "number"
    t.integer "discount"
  end

  create_table "shopping_cart_credit_cards", force: :cascade do |t|
    t.string  "number"
    t.integer "cvv"
    t.string  "first_name"
    t.string  "last_name"
    t.integer "user_id"
    t.integer "exp_month"
    t.integer "exp_year"
  end

  create_table "shopping_cart_deliveries", force: :cascade do |t|
    t.string  "name"
    t.integer "price", default: 0
  end

  create_table "shopping_cart_order_billing_addresses", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "street"
    t.string  "city"
    t.integer "country_id"
    t.integer "order_id"
    t.string  "zip"
    t.string  "phone"
  end

  create_table "shopping_cart_order_items", force: :cascade do |t|
    t.integer "price"
    t.integer "quantity"
    t.integer "product_id"
    t.integer "book_id"
    t.integer "order_id"
  end

  create_table "shopping_cart_order_shipping_addresses", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "street"
    t.string  "city"
    t.integer "country_id"
    t.integer "order_id"
    t.string  "zip"
    t.string  "phone"
  end

  create_table "shopping_cart_orders", force: :cascade do |t|
    t.string   "aasm_state"
    t.integer  "total_price",    default: 0, null: false
    t.datetime "completed_date"
    t.integer  "user_id"
    t.integer  "credit_card_id"
    t.integer  "coupon_id"
    t.integer  "delivery_id"
  end

  create_table "shopping_cart_shipping_addresses", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "street"
    t.string  "city"
    t.integer "country_id"
    t.string  "zip"
    t.string  "phone"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "address_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
