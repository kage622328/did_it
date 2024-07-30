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

ActiveRecord::Schema[7.1].define(version: 2024_07_30_054821) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "name"], name: "index_children_on_user_id_and_name", unique: true
    t.index ["user_id"], name: "index_children_on_user_id"
  end

  create_table "coins", force: :cascade do |t|
    t.bigint "child_id"
    t.integer "coin_amount", default: 0, null: false
    t.datetime "date_awarded", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_coins_on_child_id"
  end

  create_table "completed_tasks", force: :cascade do |t|
    t.bigint "child_id"
    t.bigint "task_id"
    t.integer "completed_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id", "task_id"], name: "index_completed_tasks_on_child_id_and_task_id", unique: true
    t.index ["child_id"], name: "index_completed_tasks_on_child_id"
    t.index ["task_id"], name: "index_completed_tasks_on_task_id"
  end

  create_table "list_tasks", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id", "task_id"], name: "index_list_tasks_on_list_id_and_task_id", unique: true
    t.index ["list_id"], name: "index_list_tasks_on_list_id"
    t.index ["task_id"], name: "index_list_tasks_on_task_id"
  end

  create_table "lists", force: :cascade do |t|
    t.bigint "child_id"
    t.string "name", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id", "name"], name: "index_lists_on_child_id_and_name", unique: true
    t.index ["child_id"], name: "index_lists_on_child_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "body", limit: 255, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, null: false
    t.string "crypt_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "children", "users"
  add_foreign_key "coins", "children"
  add_foreign_key "completed_tasks", "children"
  add_foreign_key "completed_tasks", "tasks"
  add_foreign_key "list_tasks", "lists"
  add_foreign_key "list_tasks", "tasks"
  add_foreign_key "lists", "children"
end
