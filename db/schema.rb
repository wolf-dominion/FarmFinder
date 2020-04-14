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

ActiveRecord::Schema.define(version: 2020_04_14_164237) do

  create_table "farm_products", force: :cascade do |t|
    t.integer "farms_id"
    t.integer "products_id"
    t.index ["farms_id"], name: "index_farm_products_on_farms_id"
    t.index ["products_id"], name: "index_farm_products_on_products_id"
  end

  create_table "farms", force: :cascade do |t|
    t.string "name"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
  end

  add_foreign_key "farm_products", "farms", column: "farms_id"
  add_foreign_key "farm_products", "products", column: "products_id"

