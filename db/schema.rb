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

ActiveRecord::Schema.define(version: 20180415201500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_publish", default: false
  end

  create_table "images", force: :cascade do |t|
    t.string "lang"
    t.string "src"
    t.string "alt"
    t.integer "sort"
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "mobility_string_translations", force: :cascade do |t|
    t.string "locale"
    t.string "key"
    t.string "value"
    t.integer "translatable_id"
    t.string "translatable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translatable_id", "translatable_type", "key"], name: "index_mobility_string_translations_on_translatable_attribute"
    t.index ["translatable_id", "translatable_type", "locale", "key"], name: "index_mobility_string_translations_on_keys", unique: true
    t.index ["translatable_type", "key", "value", "locale"], name: "index_mobility_string_translations_on_query_keys"
  end

  create_table "mobility_text_translations", force: :cascade do |t|
    t.string "locale"
    t.string "key"
    t.text "value"
    t.integer "translatable_id"
    t.string "translatable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translatable_id", "translatable_type", "key"], name: "index_mobility_text_translations_on_translatable_attribute"
    t.index ["translatable_id", "translatable_type", "locale", "key"], name: "index_mobility_text_translations_on_keys", unique: true
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "video_src"
    t.string "permalink"
    t.integer "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_publish", default: false
    t.boolean "is_highlight", default: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "sort"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_publish", default: false
  end

end
