# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_03_18_171048) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "support_emails", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "from_email"
    t.boolean "processed"
    t.datetime "received_at"
    t.string "subject"
    t.bigint "ticket_id"
    t.string "to_email"
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["ticket_id"], name: "index_support_emails_on_ticket_id"
    t.index ["user_id"], name: "index_support_emails_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "assigned_to"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "priority"
    t.string "source"
    t.string "status"
    t.string "subject"
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.boolean "login_disabled"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "support_emails", "tickets"
  add_foreign_key "support_emails", "users"
  add_foreign_key "tickets", "users"
end
