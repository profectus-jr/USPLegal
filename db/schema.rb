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

ActiveRecord::Schema.define(version: 20150511151153) do

  create_table "answers", force: true do |t|
    t.integer  "is_ok"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inspection_id"
    t.integer  "checklist_item_id"
    t.string   "comment"
  end

  create_table "buildings", force: true do |t|
    t.string   "idAtlas"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checklist_items", force: true do |t|
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "equip_type_id"
    t.boolean  "current"
  end

  create_table "equip_types", force: true do |t|
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "equipment", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_there"
    t.datetime "creation_date"
    t.integer  "equip_type_id"
    t.string   "building_id"
    t.string   "name"
    t.integer  "floor"
    t.string   "id_place"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "vist_date"
    t.string   "building_id"
  end

  create_table "inspections", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_url"
    t.integer  "user_id"
    t.integer  "equipment_id"
    t.string   "description"
    t.integer  "approved"
    t.integer  "sent"
    t.integer  "group_id"
  end

  create_table "reportconfig", force: true do |t|
    t.integer  "id_checklist"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "uploads", force: true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answer_id"
  end

  create_table "users", force: true do |t|
    t.integer  "nusp"
    t.string   "cpf"
    t.string   "name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
