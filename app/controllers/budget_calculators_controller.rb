class BudgetCalculatorsController < ApplicationController
  # skip_before_action(:force_budget_calculator_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "budget_calculator_sessions/sign_up.html.erb" })
  end

  def create
    @budget_calculator = BudgetCalculator.new
    @budget_calculator.email = params.fetch("query_email")
    @budget_calculator.password = params.fetch("query_password")
    @budget_calculator.password_confirmation = params.fetch("query_password_confirmation")
    @budget_calculator.monthly_income__salarywages = params.fetch("query_monthly_income__salarywages")
    @budget_calculator.monthly_income__other_income = params.fetch("query_monthly_income__other_income")
    @budget_calculator.housing_expenses__mortgage = params.fetch("query_housing_expenses__mortgage")
    @budget_calculator.housing_expenses__hoa_fees = params.fetch("query_housing_expenses__hoa_fees")
    @budget_calculator.housing_expenses__rent = params.fetch("query_housing_expenses__rent")
    @budget_calculator.housing_expenses__home_insurance = params.fetch("query_housing_expenses__home_insurance")
    @budget_calculator.housing_expenses__repairs_maintenance = params.fetch("query_housing_expenses__repairs_maintenance")
    @budget_calculator.housing_expenses__water__gas__electricity = params.fetch("query_housing_expenses__water__gas__electricity")
    @budget_calculator.housing_expenses__cable__tv__internet = params.fetch("query_housing_expenses__cable__tv__internet")
    @budget_calculator.housing_expenses__phone_cell = params.fetch("query_housing_expenses__phone_cell")
    @budget_calculator.user_id = params.fetch("query_user_id")
    @budget_calculator.transportation_expenses__car_payment = params.fetch("query_transportation_expenses__car_payment")
    @budget_calculator.transportation_expenses__car_insurance = params.fetch("query_transportation_expenses__car_insurance")
    @budget_calculator.transportation_expenses__gas__fuel = params.fetch("query_transportation_expenses__gas__fuel")
    @budget_calculator.transportation_expenses__car_repairs = params.fetch("query_transportation_expenses__car_repairs")
    @budget_calculator.educational_expenses__school_supplies = params.fetch("query_educational_expenses__school_supplies")
    @budget_calculator.educational_expenses__student_loans = params.fetch("query_educational_expenses__student_loans")
    @budget_calculator.educational_expenses__college_tuition = params.fetch("query_educational_expenses__college_tuition")
    @budget_calculator.food_and_personal__groceries__household = params.fetch("query_food_and_personal__groceries__household")
    @budget_calculator.food_and_personal__clothing = params.fetch("query_food_and_personal__clothing")
    @budget_calculator.food_and_personal__entertainment = params.fetch("query_food_and_personal__entertainment")
    @budget_calculator.food_and_personal__medical = params.fetch("query_food_and_personal__medical")
    @budget_calculator.food_and_personal__pet_supplies = params.fetch("query_food_and_personal__pet_supplies")
    @budget_calculator.food_and_personal__other_expenses = params.fetch("query_food_and_personal__other_expenses")
    @budget_calculator.monthly_savings__emergency_fund = params.fetch("query_monthly_savings__emergency_fund")
    @budget_calculator.monthly_savings__investments = params.fetch("query_monthly_savings__investments")
    @budget_calculator.monthly_spend__budget = params.fetch("query_monthly_spend__budget")

    save_status = @budget_calculator.save

    if save_status == true
      session.store(:budget_calculator_id,  @budget_calculator.id)
   
      redirect_to("/", { :notice => "Budget calculator account created successfully."})
    else
      redirect_to("/budget_calculator_sign_up", { :alert => "Budget calculator account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "budget_calculators/edit_profile.html.erb" })
  end

  def update
    @budget_calculator = @current_budget_calculator
    @budget_calculator.email = params.fetch("query_email")
    @budget_calculator.password = params.fetch("query_password")
    @budget_calculator.password_confirmation = params.fetch("query_password_confirmation")
    @budget_calculator.monthly_income__salarywages = params.fetch("query_monthly_income__salarywages")
    @budget_calculator.monthly_income__other_income = params.fetch("query_monthly_income__other_income")
    @budget_calculator.housing_expenses__mortgage = params.fetch("query_housing_expenses__mortgage")
    @budget_calculator.housing_expenses__hoa_fees = params.fetch("query_housing_expenses__hoa_fees")
    @budget_calculator.housing_expenses__rent = params.fetch("query_housing_expenses__rent")
    @budget_calculator.housing_expenses__home_insurance = params.fetch("query_housing_expenses__home_insurance")
    @budget_calculator.housing_expenses__repairs_maintenance = params.fetch("query_housing_expenses__repairs_maintenance")
    @budget_calculator.housing_expenses__water__gas__electricity = params.fetch("query_housing_expenses__water__gas__electricity")
    @budget_calculator.housing_expenses__cable__tv__internet = params.fetch("query_housing_expenses__cable__tv__internet")
    @budget_calculator.housing_expenses__phone_cell = params.fetch("query_housing_expenses__phone_cell")
    @budget_calculator.user_id = params.fetch("query_user_id")
    @budget_calculator.transportation_expenses__car_payment = params.fetch("query_transportation_expenses__car_payment")
    @budget_calculator.transportation_expenses__car_insurance = params.fetch("query_transportation_expenses__car_insurance")
    @budget_calculator.transportation_expenses__gas__fuel = params.fetch("query_transportation_expenses__gas__fuel")
    @budget_calculator.transportation_expenses__car_repairs = params.fetch("query_transportation_expenses__car_repairs")
    @budget_calculator.educational_expenses__school_supplies = params.fetch("query_educational_expenses__school_supplies")
    @budget_calculator.educational_expenses__student_loans = params.fetch("query_educational_expenses__student_loans")
    @budget_calculator.educational_expenses__college_tuition = params.fetch("query_educational_expenses__college_tuition")
    @budget_calculator.food_and_personal__groceries__household = params.fetch("query_food_and_personal__groceries__household")
    @budget_calculator.food_and_personal__clothing = params.fetch("query_food_and_personal__clothing")
    @budget_calculator.food_and_personal__entertainment = params.fetch("query_food_and_personal__entertainment")
    @budget_calculator.food_and_personal__medical = params.fetch("query_food_and_personal__medical")
    @budget_calculator.food_and_personal__pet_supplies = params.fetch("query_food_and_personal__pet_supplies")
    @budget_calculator.food_and_personal__other_expenses = params.fetch("query_food_and_personal__other_expenses")
    @budget_calculator.monthly_savings__emergency_fund = params.fetch("query_monthly_savings__emergency_fund")
    @budget_calculator.monthly_savings__investments = params.fetch("query_monthly_savings__investments")
    @budget_calculator.monthly_spend__budget = params.fetch("query_monthly_spend__budget")
    
    if @budget_calculator.valid?
      @budget_calculator.save

      redirect_to("/", { :notice => "Budget calculator account updated successfully."})
    else
      render({ :template => "budget_calculators/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_budget_calculator.destroy
    reset_session
    
    redirect_to("/", { :notice => "BudgetCalculator account cancelled" })
  end
  
end
