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

ActiveRecord::Schema[7.0].define(version: 2023_05_16_105205) do
  create_table "games", force: :cascade do |t|
    t.integer "game_id", null: false
    t.string "status", null: false
    t.date "start_date", null: false
    t.string "who_moves", null: false
    t.string "fen", null: false
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_white_id", null: false
    t.integer "player_black_id", null: false
    t.index ["game_id"], name: "index_games_on_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "player_id"
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "players", column: "player_black_id"
  add_foreign_key "games", "players", column: "player_white_id"
end
