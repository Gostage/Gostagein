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

ActiveRecord::Schema.define(version: 2020_05_14_164002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "questioner_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.boolean "read", default: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["questioner_id"], name: "index_comments_on_questioner_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "favorite_user_id"
    t.bigint "favorite_internship_id"
    t.index ["favorite_internship_id"], name: "index_favorites_on_favorite_internship_id"
    t.index ["favorite_user_id"], name: "index_favorites_on_favorite_user_id"
  end

  create_table "internships", force: :cascade do |t|
    t.string "adress"
    t.string "zipcode"
    t.string "city"
    t.string "specialty"
    t.string "organization"
    t.string "population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.text "description"
    t.string "title"
    t.string "cursus"
    t.float "duration"
    t.string "region"
    t.integer "remuneration"
    t.index ["user_id"], name: "index_internships_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.float "notation"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "review_user_id"
    t.bigint "review_internship_id"
    t.index ["review_internship_id"], name: "index_reviews_on_review_internship_id"
    t.index ["review_user_id"], name: "index_reviews_on_review_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "users", column: "questioner_id"
  add_foreign_key "favorites", "internships", column: "favorite_internship_id"
  add_foreign_key "favorites", "users", column: "favorite_user_id"
  add_foreign_key "internships", "users"
  add_foreign_key "reviews", "internships", column: "review_internship_id"
  add_foreign_key "reviews", "users", column: "review_user_id"
end
