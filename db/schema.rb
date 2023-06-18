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

ActiveRecord::Schema[7.0].define(version: 2023_06_18_051926) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chickens", force: :cascade do |t|
    t.bigint "farm_id", null: false
    t.string "gender"
    t.integer "egg", default: 0
    t.integer "energy", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farm_id"], name: "index_chickens_on_farm_id"
  end

  create_table "cows", force: :cascade do |t|
    t.bigint "farm_id", null: false
    t.string "gender"
    t.integer "milk", default: 0
    t.integer "energy", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farm_id"], name: "index_cows_on_farm_id"
  end

  create_table "farms", force: :cascade do |t|
    t.string "name"
    t.integer "age_in_days", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tomatoes", force: :cascade do |t|
    t.bigint "farm_id", null: false
    t.integer "crop", default: 0
    t.integer "water", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farm_id"], name: "index_tomatoes_on_farm_id"
  end

  create_table "wheats", force: :cascade do |t|
    t.bigint "farm_id", null: false
    t.integer "crop", default: 0
    t.integer "water", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farm_id"], name: "index_wheats_on_farm_id"
  end

  add_foreign_key "chickens", "farms"
  add_foreign_key "cows", "farms"
  add_foreign_key "tomatoes", "farms"
  add_foreign_key "wheats", "farms"
end
