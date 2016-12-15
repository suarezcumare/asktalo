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

ActiveRecord::Schema.define(version: 20160106145230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text     "description",                    null: false
    t.boolean  "answer_correct", default: false, null: false
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "labels", force: :cascade do |t|
    t.string   "name",                       null: false
    t.text     "description", default: "",   null: false
    t.boolean  "available",   default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "question_labels", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "label_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "question_labels", ["label_id"], name: "index_question_labels_on_label_id", using: :btree
  add_index "question_labels", ["question_id"], name: "index_question_labels_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "description",             null: false
    t.integer  "view_count",  default: 0, null: false
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",              null: false
    t.string   "encrypted_password",     default: "",              null: false
    t.string   "first_name",                                       null: false
    t.string   "last_name",                                        null: false
    t.boolean  "sex",                    default: true,            null: false
    t.text     "biography",              default: "No biography",  null: false
    t.text     "occupation",             default: "No occupation", null: false
    t.string   "twitter",                default: "",              null: false
    t.string   "linkedin",               default: "",              null: false
    t.string   "github",                 default: "",              null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,               null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "picture"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "question_labels", "labels"
  add_foreign_key "question_labels", "questions"
  add_foreign_key "questions", "users"
end
