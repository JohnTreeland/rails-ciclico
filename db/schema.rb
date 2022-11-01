# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_29_153047) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.float "longitude"
    t.float "latitude"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "materials", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "petitions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "material_id", null: false
    t.datetime "date", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "collector_id"
    t.integer "status", default: 0
    t.index ["collector_id"], name: "index_petitions_on_collector_id"
    t.index ["material_id"], name: "index_petitions_on_material_id"
    t.index ["user_id"], name: "index_petitions_on_user_id"
  end

  create_table "recycling_sites", force: :cascade do |t|
    t.bigint "material_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "collector_id"
    t.string "name"
    t.index ["collector_id"], name: "index_recycling_sites_on_collector_id"
    t.index ["material_id"], name: "index_recycling_sites_on_material_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "collector"
    t.text "tax_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "petitions", "materials"
  add_foreign_key "petitions", "users"
  add_foreign_key "petitions", "users", column: "collector_id"
  add_foreign_key "recycling_sites", "materials"
  add_foreign_key "recycling_sites", "users", column: "collector_id"
end
