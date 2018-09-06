ActiveRecord::Schema.define(version: 2018_09_04_022916) do

  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 9, scale: 2
    t.string "image_url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
