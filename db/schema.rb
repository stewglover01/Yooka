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

ActiveRecord::Schema.define(version: 2020_08_31_142014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "xp"
    t.integer "time_to_complete"
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_activities_on_lesson_id"
  end

  create_table "badge_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "badge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["badge_id"], name: "index_badge_users_on_badge_id"
    t.index ["user_id"], name: "index_badge_users_on_user_id"
  end

  create_table "badges", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "daily_moods", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "mood_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mood_id"], name: "index_daily_moods_on_mood_id"
    t.index ["user_id"], name: "index_daily_moods_on_user_id"
  end

  create_table "habits", force: :cascade do |t|
    t.string "name"
    t.integer "xp"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "journey_habits", force: :cascade do |t|
    t.boolean "complete"
    t.bigint "journey_id", null: false
    t.bigint "habit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["habit_id"], name: "index_journey_habits_on_habit_id"
    t.index ["journey_id"], name: "index_journey_habits_on_journey_id"
  end

  create_table "journey_lessons", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.boolean "complete"
    t.bigint "journey_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journey_id"], name: "index_journey_lessons_on_journey_id"
    t.index ["lesson_id"], name: "index_journey_lessons_on_lesson_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_journeys_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "author"
    t.string "topic"
    t.integer "time_to_complete"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "author_description"
    t.string "author_photo"
  end

  create_table "moods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.string "correct_answer"
    t.string "possible_answers"
    t.bigint "activity_id"
    t.bigint "habit_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_questions_on_activity_id"
    t.index ["habit_id"], name: "index_questions_on_habit_id"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.boolean "correct"
    t.index ["question_id"], name: "index_responses_on_question_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "year_level"
    t.string "school_name"
    t.string "school_class"
    t.integer "xp"
    t.boolean "teacher"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "time_to_complete"
    t.integer "xp"
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "video"
    t.index ["lesson_id"], name: "index_videos_on_lesson_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "lessons"
  add_foreign_key "badge_users", "badges"
  add_foreign_key "badge_users", "users"
  add_foreign_key "daily_moods", "moods"
  add_foreign_key "daily_moods", "users"
  add_foreign_key "journey_habits", "habits"
  add_foreign_key "journey_habits", "journeys"
  add_foreign_key "journey_lessons", "journeys"
  add_foreign_key "journey_lessons", "lessons"
  add_foreign_key "journeys", "users"
  add_foreign_key "questions", "activities"
  add_foreign_key "questions", "habits"
  add_foreign_key "responses", "questions"
  add_foreign_key "responses", "users"
  add_foreign_key "videos", "lessons"
end
