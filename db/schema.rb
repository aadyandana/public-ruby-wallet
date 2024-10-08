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

ActiveRecord::Schema[7.2].define(version: 2024_10_02_145300) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sessions", force: :cascade do |t|
    t.bigint "wallet_id", null: false
    t.string "session_type", null: false
    t.string "token", null: false
    t.datetime "expired_at", precision: nil, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_sessions_on_token", unique: true
    t.index ["wallet_id"], name: "index_sessions_on_wallet_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "sender_wallet_id"
    t.bigint "receiver_wallet_id"
    t.decimal "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_wallet_id"], name: "index_transactions_on_receiver_wallet_id"
    t.index ["sender_wallet_id"], name: "index_transactions_on_sender_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.string "owner_type"
    t.decimal "balance", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "sessions", "wallets"
  add_foreign_key "transactions", "wallets", column: "receiver_wallet_id"
  add_foreign_key "transactions", "wallets", column: "sender_wallet_id"
end
