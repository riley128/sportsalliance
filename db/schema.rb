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

ActiveRecord::Schema.define(version: 20131217162435) do

  create_table "event_users", force: true do |t|
    t.integer  "event_id"
    t.integer  "uid"
    t.string   "event_name"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_admin"
    t.boolean  "is_host"
    t.boolean  "is_guest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "event_name",                  default: "", null: false
    t.string   "header",                      default: "", null: false
    t.string   "sub_header",                  default: "", null: false
    t.integer  "price",                       default: 20, null: false
    t.string   "venue",                       default: "", null: false
    t.string   "address",                     default: "", null: false
    t.string   "description",                 default: "", null: false
    t.datetime "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.string   "banner600x2000_file_name"
    t.string   "banner600x2000_content_type"
    t.integer  "banner600x2000_file_size"
    t.datetime "banner600x2000_updated_at"
    t.string   "bannersquare_file_name"
    t.string   "bannersquare_content_type"
    t.integer  "bannersquare_file_size"
    t.datetime "bannersquare_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider",               default: "", null: false
    t.string   "uid",                    default: "", null: false
    t.string   "nickname",               default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "image",                  default: "", null: false
    t.string   "urls",                   default: "", null: false
    t.string   "location",               default: "", null: false
    t.string   "verified",               default: "", null: false
    t.string   "token",                  default: "", null: false
    t.datetime "expires_at",                          null: false
    t.string   "expires",                default: "", null: false
    t.string   "gender",                 default: "", null: false
    t.string   "timezone",               default: "", null: false
    t.string   "locale",                 default: "", null: false
    t.string   "hometown",               default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
