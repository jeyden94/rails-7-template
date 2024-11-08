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

ActiveRecord::Schema[7.1].define(version: 2024_11_07_194107) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "game_password", null: false
    t.integer "game_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_players", default: 5
    t.integer "total_bots", default: 0
    t.index ["game_password"], name: "index_games_on_game_password", unique: true
  end

  create_table "players", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.string "player_name", null: false
    t.integer "suspect_id"
    t.datetime "joined_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_bot", default: false
    t.index ["game_id"], name: "index_players_on_game_id"
  end

  add_foreign_key "players", "games"
end
