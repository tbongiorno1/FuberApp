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

ActiveRecord::Schema.define(version: 20161107034929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "profile_image_id"
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "ahoy_messages", force: :cascade do |t|
    t.string   "token"
    t.text     "to"
    t.integer  "admin_id"
    t.string   "admin_type"
    t.string   "mailer"
    t.text     "subject"
    t.text     "content"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "sent_at"
    t.datetime "opened_at"
    t.datetime "clicked_at"
    t.index ["admin_id", "admin_type"], name: "index_ahoy_messages_on_admin_id_and_admin_type", using: :btree
    t.index ["token"], name: "index_ahoy_messages_on_token", using: :btree
  end

  create_table "course_subscribers", force: :cascade do |t|
    t.integer  "subscriber_id"
    t.integer  "course_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["course_id"], name: "index_course_subscribers_on_course_id", using: :btree
    t.index ["subscriber_id"], name: "index_course_subscribers_on_subscriber_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "tagline"
    t.text     "description"
    t.integer  "admin_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "slug"
    t.string   "course_image_id"
    t.index ["admin_id"], name: "index_courses_on_admin_id", using: :btree
    t.index ["slug"], name: "index_courses_on_slug", unique: true, using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "course_id"
    t.integer  "admin_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "slug"
    t.integer  "order",      default: 0
    t.index ["admin_id"], name: "index_posts_on_admin_id", using: :btree
    t.index ["course_id"], name: "index_posts_on_course_id", using: :btree
    t.index ["slug"], name: "index_posts_on_slug", unique: true, using: :btree
  end

  create_table "queue_task_emails", force: :cascade do |t|
    t.string   "email"
    t.string   "queue_task_emails"
    t.integer  "subscriber_id"
    t.integer  "course_id"
    t.integer  "post_id"
    t.boolean  "sent"
    t.boolean  "opened"
    t.boolean  "bounced"
    t.datetime "day_to_send"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.datetime "opened_date"
    t.index ["course_id"], name: "index_queue_task_emails_on_course_id", using: :btree
    t.index ["post_id"], name: "index_queue_task_emails_on_post_id", using: :btree
    t.index ["subscriber_id"], name: "index_queue_task_emails_on_subscriber_id", using: :btree
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "course_subscribers", "courses"
  add_foreign_key "course_subscribers", "subscribers"
  add_foreign_key "courses", "admins"
  add_foreign_key "posts", "admins"
  add_foreign_key "posts", "courses"
  add_foreign_key "queue_task_emails", "courses"
  add_foreign_key "queue_task_emails", "posts"
  add_foreign_key "queue_task_emails", "subscribers"
end
