# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091130174654) do

  create_table "piece_versions", :force => true do |t|
    t.integer  "piece_id"
    t.integer  "version"
    t.string   "text"
    t.integer  "user_id"
    t.integer  "work_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "piece_versions", ["piece_id"], :name => "index_piece_versions_on_piece_id"

  create_table "pieces", :force => true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "work_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.integer  "version"
  end

  add_index "pieces", ["work_id"], :name => "index_pieces_on_work_id"
  add_index "pieces", ["user_id"], :name => "index_pieces_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "works", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "works", ["user_id"], :name => "index_works_on_user_id"

end
