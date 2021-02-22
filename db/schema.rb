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

ActiveRecord::Schema.define(version: 2021_02_22_164019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "name", null: false
    t.integer "zip", null: false
    t.integer "prefecture_id", null: false
    t.string "city", null: false
    t.string "town", null: false
    t.string "building"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity", default: 0
    t.bigint "souvenir_id"
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["souvenir_id"], name: "index_cart_items_on_souvenir_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity", default: 0
    t.bigint "souvenir_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["souvenir_id"], name: "index_order_items_on_souvenir_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "state", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "souvenir_id"
    t.bigint "user_id"
    t.text "comment"
    t.float "rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["souvenir_id"], name: "index_reviews_on_souvenir_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "souvenirs", force: :cascade do |t|
    t.string "name", null: false
    t.text "image"
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prefecture_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "seller", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "souvenirs"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "souvenirs"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "souvenirs"
  add_foreign_key "reviews", "users"
end
