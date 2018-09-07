ActiveRecord::Schema.define(version: 2018_09_07_012052) do

  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 9, scale: 2
    t.string "image_url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_number"], name: "index_suppliers_on_phone_number"
  end

end
