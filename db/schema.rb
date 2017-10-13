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

ActiveRecord::Schema.define(version: 20151022125839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.integer "author_id"
    t.string "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kalenders", force: :cascade do |t|
    t.bigint "number"
    t.integer "prize_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["prize_id"], name: "index_kalenders_on_prize_id"
  end

  create_table "prizes", force: :cascade do |t|
    t.integer "sponsor_id"
    t.integer "day_id"
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "anzahl"
    t.integer "cost"
    t.string "lions_member"
    t.index ["day_id"], name: "index_prizes_on_day_id"
    t.index ["sponsor_id"], name: "index_prizes_on_sponsor_id"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "name"
    t.string "person"
    t.string "address"
    t.string "city"
    t.string "phone"
    t.string "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "email"
    t.string "fax"
    t.integer "year"
  end

end
