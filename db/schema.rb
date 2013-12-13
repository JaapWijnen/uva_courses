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

ActiveRecord::Schema.define(version: 20131212171853) do

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

end
