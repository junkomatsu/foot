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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110828131624) do

  create_table "battles", :force => true do |t|
    t.integer  "user_id1"
    t.integer  "user_id2"
    t.integer  "status"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.integer  "type"
    t.string   "name"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "lobbies" because of following StandardError
#   Unknown type 'id' for column 'user_id'

  create_table "units", :force => true do |t|
    t.integer  "user_id"
    t.integer  "status"
    t.string   "icon"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "screen_name"
    t.integer  "status"
    t.integer  "rank"
    t.integer  "point"
    t.string   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "id_str"
    t.string   "icon_url"
    t.string   "twitter_access_token"
    t.string   "twitter_access_token_secret"
  end

end
