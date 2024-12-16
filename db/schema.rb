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

ActiveRecord::Schema[7.2].define(version: 2024_12_16_061735) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emission_calculation_request_items", force: :cascade do |t|
    t.bigint "emission_calculation_request_id", null: false
    t.bigint "emission_factor_id"
    t.decimal "quantity", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "normalized_quantity", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "computed_emission_in_grams", precision: 10, scale: 2
    t.string "error_message", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emission_calculation_request_id"], name: "idx_on_emission_calculation_request_id_6f8c7955e4"
    t.index ["emission_factor_id"], name: "index_emission_calculation_request_items_on_emission_factor_id"
  end

  create_table "emission_calculation_requests", force: :cascade do |t|
    t.boolean "processed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emission_factors", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.decimal "quantity", precision: 10, scale: 2, default: "0.0", null: false
    t.string "unit", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "emission_calculation_request_items", "emission_calculation_requests"
  add_foreign_key "emission_calculation_request_items", "emission_factors"
end
