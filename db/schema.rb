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

ActiveRecord::Schema[7.0].define(version: 2022_12_03_221402) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: :cascade do |t|
    t.bigint "poll_id", default: 0, null: false
    t.string "choice_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_choices_on_poll_id"
  end

  create_table "polls", force: :cascade do |t|
    t.bigint "user_id", default: 0, null: false
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_polls_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", default: 0, null: false
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["id"], name: "index_users_on_id", unique: true
    t.index ["name", "email"], name: "index_users_on_name_and_email", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "poll_id", default: 0, null: false
    t.bigint "choice_id", default: 0, null: false
    t.bigint "user_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id", "poll_id"], name: "index_votes_on_choice_id_and_poll_id", unique: true
    t.index ["choice_id"], name: "index_votes_on_choice_id"
    t.index ["poll_id"], name: "index_votes_on_poll_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "choices", "polls"
  add_foreign_key "polls", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "votes", "choices"
  add_foreign_key "votes", "polls"
  add_foreign_key "votes", "users"
end
