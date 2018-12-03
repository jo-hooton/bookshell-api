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

ActiveRecord::Schema.define(version: 2018_12_03_113638) do

  create_table "booklets", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "published"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "heading"
    t.string "sub_heading"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gallery_items", force: :cascade do |t|
    t.string "image"
    t.string "heading"
    t.string "sub_heading"
    t.string "content"
    t.integer "gallery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_items", force: :cascade do |t|
    t.string "heading"
    t.string "content"
    t.string "image"
    t.integer "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "heading"
    t.string "sub_heading"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.integer "number"
    t.integer "booklet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "text_items", force: :cascade do |t|
    t.string "heading"
    t.string "sub_heading"
    t.string "content"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
