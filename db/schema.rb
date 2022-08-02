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

ActiveRecord::Schema[7.0].define(version: 2022_08_02_170923) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "auth_providers", force: :cascade do |t|
    t.string "email", null: false
    t.integer "provider_type"
    t.bigint "user_id", null: false
    t.string "access_token"
    t.string "refresh_token"
    t.string "id_token"
    t.datetime "access_token_exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_auth_providers_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "on_behalf_id"
    t.string "currency"
    t.string "pdf_url"
    t.string "status"
    t.datetime "start_subscription"
    t.datetime "end_subscription"
    t.string "subscription_id", null: false
    t.string "total_amount", null: false
    t.integer "total_amount_decimal"
    t.string "discount"
    t.string "tax_amount"
    t.string "coupon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["on_behalf_id"], name: "index_invoices_on_on_behalf_id"
    t.index ["subscription_id"], name: "index_invoices_on_subscription_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.integer "employee_range"
    t.string "ext_id"
    t.string "access_code"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ext_id"], name: "index_organisations_on_ext_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "on_behalf_id"
    t.bigint "user_id", null: false
    t.bigint "invoice_id", null: false
    t.string "amount"
    t.integer "amount_decimal"
    t.string "status"
    t.string "payment_method"
    t.string "payment_date"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_payments_on_invoice_id"
    t.index ["on_behalf_id"], name: "index_payments_on_on_behalf_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "title", null: false
    t.string "amount", null: false
    t.integer "interval", null: false
    t.integer "interval_count", null: false
    t.integer "quantity"
    t.string "additional_user_rate"
    t.string "currency", null: false
    t.integer "trial_days", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "plan_id", null: false
    t.bigint "subscriber_id", null: false
    t.bigint "on_behalf_id"
    t.string "currency"
    t.datetime "current_period_start"
    t.datetime "current_period_end"
    t.string "default_payment_method"
    t.text "description"
    t.string "last_invoice_id"
    t.string "status"
    t.string "canceled_at"
    t.text "cancelation_reason"
    t.string "discount"
    t.datetime "trial_start"
    t.datetime "trial_end"
    t.string "interval"
    t.string "interval_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plan_id"], name: "index_subscriptions_on_plan_id"
    t.index ["subscriber_id"], name: "index_subscriptions_on_subscriber_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.bigint "organisation_id_id"
    t.boolean "status"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organisation_id_id"], name: "index_users_on_organisation_id_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "auth_providers", "users"
  add_foreign_key "invoices", "users"
  add_foreign_key "payments", "invoices"
  add_foreign_key "payments", "users"
  add_foreign_key "subscriptions", "plans"
end
