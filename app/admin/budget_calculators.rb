ActiveAdmin.register BudgetCalculator do
  permit_params :email, :password_digest, :monthly_income__salarywages, :monthly_income__other_income, :housing_expenses__mortgage, :housing_expenses__hoa_fees, :housing_expenses__rent, :housing_expenses__home_insurance, :housing_expenses__repairs_maintenance, :housing_expenses__water__gas__electricity, :housing_expenses__cable__tv__internet, :housing_expenses__phone_cell, :user_id, :transportation_expenses__car_payment, :transportation_expenses__car_insurance, :transportation_expenses__gas__fuel, :transportation_expenses__car_repairs, :educational_expenses__school_supplies, :educational_expenses__student_loans, :educational_expenses__college_tuition, :food_and_personal__groceries__household, :food_and_personal__clothing, :food_and_personal__entertainment, :food_and_personal__medical, :food_and_personal__pet_supplies, :food_and_personal__other_expenses, :monthly_savings__emergency_fund, :monthly_savings__investments, :monthly_spend__budget


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
