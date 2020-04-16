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

ActiveRecord::Schema.define(version: 2020_04_16_194215) do

  create_table "farm_products", force: :cascade do |t|
    t.integer "farm_id"
    t.integer "product_id"
    t.integer "quantity"
    t.index ["farm_id"], name: "index_farm_products_on_farm_id"
    t.index ["product_id"], name: "index_farm_products_on_product_id"
  end

  create_table "farms", force: :cascade do |t|
    t.string "name"
    t.text "website"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "farm_products", "farms"
  add_foreign_key "farm_products", "products"
end
