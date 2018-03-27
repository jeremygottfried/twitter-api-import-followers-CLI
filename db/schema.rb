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

ActiveRecord::Schema.define(version: 20180325231849) do

  create_table "followers", force: :cascade do |t|
    t.integer "twitter_id", limit: 8
    t.string "id_str"
    t.string "name"
    t.string "screen_name"
    t.string "location"
    t.string "description"
    t.string "url"
    t.boolean "protected"
    t.integer "followers_count", limit: 8
    t.integer "friends_count", limit: 8
    t.integer "listed_count", limit: 8
    t.string "created_at"
    t.integer "favourites_count", limit: 8
    t.string "utc_offset"
    t.string "time_zone"
    t.boolean "geo_enabled"
    t.boolean "verified"
    t.integer "statuses_count", limit: 8
    t.string "lang"
    t.boolean "contributors_enabled"
    t.boolean "is_translator"
    t.boolean "is_translation_enabled"
    t.string "profile_background_color"
    t.string "profile_background_image_url"
    t.string "profile_background_image_url_https"
    t.boolean "profile_background_tile"
    t.string "profile_image_url"
    t.string "profile_image_url_https"
    t.string "profile_banner_url"
    t.string "profile_link_color"
    t.string "profile_sidebar_border_color"
    t.string "profile_sidebar_fill_color"
    t.string "profile_text_color"
    t.boolean "profile_use_background_image"
    t.boolean "has_extended_profile"
    t.boolean "default_profile"
    t.boolean "default_profile_image"
    t.boolean "following"
    t.boolean "live_following"
    t.boolean "follow_request_sent"
    t.boolean "notifications"
    t.boolean "muting"
    t.boolean "blocking"
    t.boolean "blocked_by"
    t.string "translator_type"
    t.string "website"
    t.string "status_text"
    t.string "status_time"
  end

end
