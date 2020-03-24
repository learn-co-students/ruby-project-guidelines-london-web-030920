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

ActiveRecord::Schema.define(version: 3) do

  create_table "contracts", force: :cascade do |t|
    t.date "start_day"
    t.date "end_day"
    t.float "wage"
    t.float "transfer_fee"
    t.integer "player_id"
    t.integer "team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "position"
    t.boolean "injured"
    t.string "injury_start"
    t.string "injury_predicted_end"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.date "founded"
    t.integer "cups_won"
  end

end
