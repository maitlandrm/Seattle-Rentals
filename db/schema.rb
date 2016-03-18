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

ActiveRecord::Schema.define(version: 20160316222232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer  "tenant_id"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "favorites", ["listing_id"], name: "index_favorites_on_listing_id", using: :btree
  add_index "favorites", ["tenant_id"], name: "index_favorites_on_tenant_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "landlords", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "business"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "listings", force: :cascade do |t|
    t.string   "neighborhood"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "price"
    t.text     "description"
    t.boolean  "pet_friendly"
    t.boolean  "hot_tub"
    t.boolean  "pool"
    t.boolean  "paid_utils"
    t.integer  "baths"
    t.integer  "half_baths"
    t.integer  "beds"
    t.boolean  "wheelchair_accessible"
    t.string   "application_path"
    t.integer  "tenant_id"
    t.integer  "landlord_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.json     "avatars"
    t.string   "category"
    t.string   "main"
  end

  add_index "listings", ["landlord_id"], name: "index_listings_on_landlord_id", using: :btree
  add_index "listings", ["tenant_id"], name: "index_listings_on_tenant_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "path"
    t.text     "caption"
    t.integer  "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photos", ["listing_id"], name: "index_photos_on_listing_id", using: :btree

  create_table "tenants", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.string   "name"
    t.string   "location"
    t.string   "image_url"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  add_foreign_key "favorites", "listings"
  add_foreign_key "favorites", "tenants"
  add_foreign_key "favorites", "users"
  add_foreign_key "listings", "landlords"
  add_foreign_key "listings", "tenants"
  add_foreign_key "photos", "listings"
end
