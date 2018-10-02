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

ActiveRecord::Schema.define(version: 20181001232000) do

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.string "size"
    t.string "year"
    t.string "revenue"
    t.text "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.integer "house_hunter_id"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_hunter_id"], name: "index_favourites_on_house_hunter_id"
    t.index ["house_id"], name: "index_favourites_on_house_id"
  end

  create_table "house_hunters", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "preferred"
  end

  create_table "houses", force: :cascade do |t|
    t.string "location"
    t.string "area"
    t.string "year"
    t.string "style"
    t.string "price"
    t.string "floors"
    t.string "basement"
    t.string "owner"
    t.string "buyers"
    t.integer "company_id"
    t.integer "realtor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["company_id"], name: "index_houses_on_company_id"
    t.index ["realtor_id"], name: "index_houses_on_realtor_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "subject"
    t.text "message"
    t.integer "house_hunter_id"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_hunter_id"], name: "index_inquiries_on_house_hunter_id"
    t.index ["house_id"], name: "index_inquiries_on_house_id"
  end

  create_table "realtors", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password"
    t.string "phone"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_realtors_on_company_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "location"
    t.decimal "min_price"
    t.decimal "max_price"
    t.decimal "min_area"
    t.decimal "max_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
