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

ActiveRecord::Schema.define(version: 20170718021221) do

  create_table "cards", force: :cascade do |t|
    t.integer  "deck_id"
    t.string   "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_cards_on_deck_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string   "deck_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_answers", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "card_id"
    t.integer  "answer"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_game_answers_on_card_id"
    t.index ["game_id"], name: "index_game_answers_on_game_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "deck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deck_id"], name: "index_games_on_deck_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "options", force: :cascade do |t|
    t.integer  "card_id"
    t.string   "option"
    t.boolean  "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_options_on_card_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
