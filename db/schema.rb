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

ActiveRecord::Schema.define(version: 2019_04_17_031519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "optimised_queries", force: :cascade do |t|
    t.integer "query_id", null: false
    t.integer "weighting", null: false
    t.string "adgroup_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rpc"
    t.float "rpi"
    t.integer "clicks"
    t.integer "impressions"
  end

  create_table "queries", force: :cascade do |t|
    t.string "query", null: false
    t.integer "search_id", null: false
    t.integer "weighting", null: false
    t.boolean "optimisation_enabled", default: true
    t.boolean "enabled", default: true
    t.string "query_stripped"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["search_id"], name: "index_queries_on_search_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "slug", null: false
    t.boolean "optimisation_enabled", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_searches_on_slug"
  end

end
