# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_03_081226) do

  create_table "fridges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "regular", null: false
    t.string "name", null: false
    t.integer "category_id", null: false
    t.integer "amount_id", null: false
    t.date "exp_date"
    t.bigint "fridge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fridge_id"], name: "index_items_on_fridge_id"
  end

  create_table "losses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.date "loss_date", null: false
    t.bigint "fridge_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fridge_id"], name: "index_losses_on_fridge_id"
    t.index ["item_id"], name: "index_losses_on_item_id"
  end

  create_table "requests", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "fridge_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fridge_id"], name: "index_requests_on_fridge_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "shopping_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "shopping_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_shopping_items_on_item_id"
    t.index ["shopping_id"], name: "index_shopping_items_on_shopping_id"
  end

  create_table "shoppings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.date "shopping_date", null: false
    t.bigint "fridge_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fridge_id"], name: "index_shoppings_on_fridge_id"
    t.index ["user_id"], name: "index_shoppings_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.string "gender", null: false
    t.date "birthday", null: false
    t.bigint "fridge_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fridge_id"], name: "index_users_on_fridge_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "items", "fridges"
  add_foreign_key "losses", "fridges"
  add_foreign_key "losses", "items"
  add_foreign_key "requests", "fridges"
  add_foreign_key "requests", "users"
  add_foreign_key "shopping_items", "items"
  add_foreign_key "shopping_items", "shoppings"
  add_foreign_key "shoppings", "fridges"
  add_foreign_key "shoppings", "users"
  add_foreign_key "users", "fridges"
end
