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

ActiveRecord::Schema.define(version: 20150512174135) do

  create_table "gigs", force: :cascade do |t|
    t.datetime "date"
    t.string   "location"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "playlist_id"
  end

  add_index "gigs", ["playlist_id"], name: "index_gigs_on_playlist_id"
  add_index "gigs", ["user_id"], name: "index_gigs_on_user_id"

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id"

  create_table "playlists_songs", id: false, force: :cascade do |t|
    t.integer "song_id",     null: false
    t.integer "playlist_id", null: false
  end

  add_index "playlists_songs", ["playlist_id", "song_id"], name: "index_playlists_songs_on_playlist_id_and_song_id"
  add_index "playlists_songs", ["song_id", "playlist_id"], name: "index_playlists_songs_on_song_id_and_playlist_id"

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "artist"
    t.integer  "rating"
    t.datetime "last_practiced"
    t.integer  "number_of_practices"
    t.text     "comment"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
  end

  add_index "songs", ["user_id"], name: "index_songs_on_user_id"

  create_table "users", force: :cascade do |t|
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
