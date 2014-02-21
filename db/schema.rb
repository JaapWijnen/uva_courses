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

ActiveRecord::Schema.define(version: 20140216190012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "acode"
    t.string   "code"
    t.string   "sgid"
    t.text     "year"
    t.integer  "ects"
    t.string   "period"
    t.text     "lecture_material"
    t.text     "timetable"
    t.text     "goals"
    t.text     "participant_count"
    t.text     "specialities"
    t.text     "examination"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_institutes", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "institute_id"
  end

  create_table "courses_programmes", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "programme_id"
  end

  create_table "courses_staffs", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "staff_id"
  end

  create_table "institutes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "list_items", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "list_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "list_items", ["course_id"], name: "index_list_items_on_course_id", using: :btree
  add_index "list_items", ["user_id", "course_id", "list_type"], name: "index_list_items_on_user_id_and_course_id_and_list_type", unique: true, using: :btree
  add_index "list_items", ["user_id"], name: "index_list_items_on_user_id", using: :btree

  create_table "programmes", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staffs", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
