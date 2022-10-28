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

ActiveRecord::Schema[7.0].define(version: 2022_10_26_031915) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "author_books", force: :cascade do |t|
    t.integer "author_id"
    t.integer "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "author_countries", force: :cascade do |t|
    t.integer "author_id"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "gender"
    t.text "summary"
    t.datetime "born"
    t.datetime "died"
    t.jsonb "wikipedia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_countries", force: :cascade do |t|
    t.integer "book_id"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "content_name"
    t.string "isbn"
    t.string "original_title"
    t.integer "year"
    t.string "language_code"
    t.text "images"
    t.text "images_urls"
    t.string "category"
    t.text "plot"
    t.string "copyright"
    t.text "title"
    t.jsonb "wikipedia"
    t.decimal "average_rating"
    t.integer "rating_count"
    t.jsonb "goodreads"
    t.text "similar_books"
    t.text "description"
    t.text "loc_class"
    t.jsonb "gutenberg"
    t.integer "pages"
    t.string "language"
    t.string "isbn13"
    t.datetime "release_date"
    t.text "cover"
    t.text "cover_art"
    t.text "summary"
    t.boolean "content_cleaned"
    t.text "classes"
    t.boolean "content_available"
    t.text "genres"
    t.jsonb "contents"
    t.integer "author"
    t.string "author_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
