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

ActiveRecord::Schema.define(version: 20161201221226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_posts", force: :cascade do |t|
    t.text     "post"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_projects", force: :cascade do |t|
    t.text     "task"
    t.boolean  "completed"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "organisation_id"
    t.integer  "group_id"
    t.integer  "user_id"
    t.integer  "group_shedule_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "group_projects_users", id: false, force: :cascade do |t|
    t.integer "group_project_id"
    t.integer "user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.text     "name"
    t.integer  "organisation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "organisation_posts", force: :cascade do |t|
    t.text     "post"
    t.integer  "organisation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "location"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "organisations_users", id: false, force: :cascade do |t|
    t.integer "organisation_id"
    t.integer "user_id"
  end

  create_table "read_marks", force: :cascade do |t|
    t.integer  "readable_id"
    t.string   "readable_type", null: false
    t.integer  "reader_id"
    t.string   "reader_type",   null: false
    t.datetime "timestamp"
  end

  add_index "read_marks", ["reader_id", "reader_type", "readable_type", "readable_id"], name: "read_marks_reader_readable_index", unique: true, using: :btree

  create_table "task_comments", force: :cascade do |t|
    t.text     "comment"
    t.string   "image"
    t.integer  "user_task_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_tasks", force: :cascade do |t|
    t.text     "task"
    t.date     "end_date"
    t.boolean  "completed",        default: false
    t.integer  "group_project_id"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.text     "password_digest"
    t.text     "pers_projects"
    t.text     "job_title"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image"
  end

end
