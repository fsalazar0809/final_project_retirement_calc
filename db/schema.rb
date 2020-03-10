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

ActiveRecord::Schema.define(version: 2020_03_10_004223) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "budget_calculators", force: :cascade do |t|
    t.integer "monthly_income__salarywages"
    t.integer "monthly_income__other_income"
    t.integer "housing_expenses__mortgage"
    t.integer "housing_expenses__hoa_fees"
    t.integer "housing_expenses__home_insurance"
    t.integer "housing_expenses__repairs_maintenance"
    t.integer "housing_expenses__water__gas__electricity"
    t.integer "housing_expenses__cable__tv__internet"
    t.integer "housing_expenses__phone_cell"
    t.string "user_id"
    t.integer "transportation_expenses__car_payment"
    t.integer "transportation_expenses__car_insurance"
    t.integer "transportation_expenses__gas__fuel"
    t.integer "transportation_expenses__car_repairs"
    t.integer "educational_expenses__school_supplies"
    t.integer "educational_expenses__student_loans"
    t.string "educational_expenses__college_tuition"
    t.integer "food_and_personal__groceries__household"
    t.integer "food_and_personal__clothing"
    t.integer "food_and_personal__entertainment"
    t.integer "food_and_personal__medical"
    t.integer "food_and_personal__pet_supplies"
    t.integer "food_and_personal__other_expenses"
    t.integer "monthly_savings__emergency_fund"
    t.integer "monthly_savings__investments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "personal_informations", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "current_age"
    t.integer "retirement_age"
    t.float "retirement_savings"
    t.float "return_on_savings"
    t.integer "life_expectancy"
    t.integer "monthly_contribution"
    t.integer "user_id"
    t.integer "budget_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
