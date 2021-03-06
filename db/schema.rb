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

ActiveRecord::Schema.define(version: 2018_06_05_082016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audio_visuals", force: :cascade do |t|
    t.integer "position"
    t.string "purpose"
    t.string "description"
    t.string "source_url"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_id", "imageable_type", "purpose", "position"], name: "index_audio_visuals_position"
    t.index ["imageable_id", "imageable_type"], name: "index_audio_visuals_imageable"
  end

  create_table "categories", force: :cascade do |t|
    t.string "grouping"
    t.string "sub_grouping"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grouping", "sub_grouping"], name: "index_categories_grouping"
  end

  create_table "course_headers", force: :cascade do |t|
    t.bigint "course_id"
    t.integer "status", default: 0
    t.integer "owner_id"
    t.string "owner_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_headers_on_course_id"
    t.index ["owner_id", "owner_type"], name: "index_course_headers_owner"
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name"
    t.string "description"
    t.string "objective"
    t.string "reason_why"
    t.bigint "parent_id"
    t.string "lineage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "lineage"], name: "index_courses_lineage"
    t.index ["category_id", "name"], name: "index_courses_name"
    t.index ["category_id"], name: "index_courses_on_category_id"
  end

  create_table "definitions", force: :cascade do |t|
    t.integer "position"
    t.string "word"
    t.string "reference_url"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "position"], name: "index_definitions_position"
    t.index ["course_id"], name: "index_definitions_on_course_id"
    t.index ["word"], name: "index_definitions_on_word", unique: true
  end

  create_table "prerequisites", force: :cascade do |t|
    t.integer "position"
    t.string "description"
    t.string "reference_url"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "position"], name: "index_prerequisites_position"
    t.index ["course_id"], name: "index_prerequisites_on_course_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.integer "position"
    t.text "question"
    t.text "answer_reference"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "position"], name: "index_qualifications_position"
    t.index ["course_id"], name: "index_qualifications_on_course_id"
  end

  create_table "transcripts", force: :cascade do |t|
    t.string "language"
    t.text "body"
    t.bigint "audio_visual_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["audio_visual_id", "language"], name: "index_transcripts_language"
    t.index ["audio_visual_id"], name: "index_transcripts_on_audio_visual_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name"
    t.string "last_name"
    t.string "type", limit: 32, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "course_headers", "courses"
  add_foreign_key "courses", "categories"
  add_foreign_key "definitions", "courses"
  add_foreign_key "prerequisites", "courses"
  add_foreign_key "qualifications", "courses"
  add_foreign_key "transcripts", "audio_visuals"
end
