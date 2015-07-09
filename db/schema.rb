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

ActiveRecord::Schema.define(version: 20150709205612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "match_players", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "match_players", ["match_id"], name: "index_match_players_on_match_id", using: :btree
  add_index "match_players", ["player_id"], name: "index_match_players_on_player_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.datetime "scheduled_start_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "match_players", "matches"
  add_foreign_key "match_players", "players"
end
