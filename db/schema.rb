# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150724144544) do

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "song_id"
    t.string  "username"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "user_id"
    t.text     "note"
    t.datetime "created_at"
    t.string   "username"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "created_by_user"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password"
  end

end
