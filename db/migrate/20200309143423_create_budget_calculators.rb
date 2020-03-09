class CreateBudgetCalculators < ActiveRecord::Migration[6.0]
  def change
    create_table :budget_calculators do |t|
      t.string :email
      t.string :password_digest
      t.integer :monthly_income__salarywages
      t.integer :monthly_income__other_income
      t.integer :housing_expenses__mortgage
      t.integer :housing_expenses__hoa_fees
      t.integer :housing_expenses__rent
      t.integer :housing_expenses__home_insurance
      t.integer :housing_expenses__repairs_maintenance
      t.integer :housing_expenses__water__gas__electricity
      t.integer :housing_expenses__cable__tv__internet
      t.integer :housing_expenses__phone_cell
      t.string :user_id
      t.integer :transportation_expenses__car_payment
      t.integer :transportation_expenses__car_insurance
      t.integer :transportation_expenses__gas__fuel
      t.integer :transportation_expenses__car_repairs
      t.integer :educational_expenses__school_supplies
      t.integer :educational_expenses__student_loans
      t.string :educational_expenses__college_tuition
      t.integer :food_and_personal__groceries__household
      t.integer :food_and_personal__clothing
      t.integer :food_and_personal__entertainment
      t.integer :food_and_personal__medical
      t.integer :food_and_personal__pet_supplies
      t.integer :food_and_personal__other_expenses
      t.integer :monthly_savings__emergency_fund
      t.integer :monthly_savings__investments
      t.integer :monthly_spend__budget

      t.timestamps
    end
  end
end
