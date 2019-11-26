# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_26_205855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "hex_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fees", force: :cascade do |t|
    t.string "engine_type"
    t.string "body_type"
    t.float "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profile_images", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "second_last_name"
    t.string "rut"
    t.date "birthdate"
    t.boolean "active"
    t.integer "gender"
    t.integer "permission", default: 0, null: false
    t.datetime "deleted_at"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_vehicle_models_on_brand_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.bigint "vehicle_model_id", null: false
    t.string "year"
    t.integer "odometer"
    t.bigint "user_id", null: false
    t.string "licence_plate"
    t.string "engine_number"
    t.string "chasis_number"
    t.integer "transmission"
    t.integer "engine_type"
    t.integer "passenger_capacity"
    t.boolean "air_conditioning"
    t.integer "airbags_quantity"
    t.integer "door_quantity"
    t.integer "traction"
    t.integer "direction"
    t.integer "body_type"
    t.boolean "visible"
    t.bigint "fee_id", null: false
    t.text "comment"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fee_id"], name: "index_vehicles_on_fee_id"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
    t.index ["vehicle_model_id"], name: "index_vehicles_on_vehicle_model_id"
  end

  add_foreign_key "vehicle_models", "brands"
  add_foreign_key "vehicles", "fees"
  add_foreign_key "vehicles", "users"
  add_foreign_key "vehicles", "vehicle_models"
end
