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

ActiveRecord::Schema.define(:version => 20111216033848) do

  create_table "identities", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string    "title"
    t.string    "url"
    t.text      "content"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "cached_slug"
    t.integer   "user_id"
  end

  create_table "slugs", :force => true do |t|
    t.string    "name"
    t.integer   "sluggable_id"
    t.integer   "sequence",                     :default => 1, :null => false
    t.string    "sluggable_type", :limit => 40
    t.string    "scope"
    t.timestamp "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "tags", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "cached_slug"
    t.integer   "posts_count", :default => 0
  end

  create_table "tagships", :force => true do |t|
    t.integer   "post_id"
    t.integer   "tag_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "provider"
    t.string    "uid"
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "cached_slug"
    t.string    "email"
  end

  create_table "votes", :force => true do |t|
    t.boolean   "vote",          :default => false
    t.integer   "voteable_id",                      :null => false
    t.string    "voteable_type",                    :null => false
    t.integer   "voter_id"
    t.string    "voter_type"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
