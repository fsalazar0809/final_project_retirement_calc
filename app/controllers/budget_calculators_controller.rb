class BudgetCalculatorsController < ApplicationController
  # skip_before_action(:force_budget_calculator_sign_in, { :only => [:new_registration_form, :create] })
  
  #def index
  #  the_id = params.fetch("user_id")
  #  @budgets = BudgetCalculator.where({:user_id => the_id }).at(0)

  #  render({ :template => "/budget_calculators/summary.html.erb" })
 # end
 
  
  def budget_information
    render({ :template => "budget_calculator_sessions/budget_overview.html.erb" })
  end

  def create
    @budget_calculator = BudgetCalculator.new
    @budget_calculator.user_id = session.fetch(:user_id)
  
    @budget_calculator.housing_expenses__mortgage = params.fetch("query_housing_expenses__mortgage")
    @budget_calculator.housing_expenses__hoa_fees = params.fetch("query_housing_expenses__hoa_fees")
    @budget_calculator.housing_expenses__home_insurance = params.fetch("query_housing_expenses__home_insurance")
    @budget_calculator.housing_expenses__repairs_maintenance = params.fetch("query_housing_expenses__repairs_maintenance")
    @budget_calculator.housing_expenses__water__gas__electricity = params.fetch("query_housing_expenses__water__gas__electricity")
    @budget_calculator.housing_expenses__cable__tv__internet = params.fetch("query_housing_expenses__cable__tv__internet")
    @budget_calculator.housing_expenses__phone_cell = params.fetch("query_housing_expenses__phone_cell")
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

    save_status = @budget_calculator.save

    if save_status == true
      session.store(:budget_calculator_id,  @budget_calculator.id)
   
      redirect_to("/summary_step_1/" + @budget_calculator.user_id.to_s + "/"+ @budget_calculator.id.to_s, { :notice => "Expenses calculated successfully."})
    else
      redirect_to("/budget_sign_up", { :alert => "Budget calculator account failed to create successfully."})
    end
  end

  
    
  def edit_registration_form
    render({ :template => "budget_calculators/edit_profile.html.erb" })
  end

  def update
    @budget_calculator = @current_budget_calculator

    @budget_calculator.housing_expenses__mortgage = params.fetch("query_housing_expenses__mortgage")
    @budget_calculator.housing_expenses__hoa_fees = params.fetch("query_housing_expenses__hoa_fees")
    @budget_calculator.housing_expenses__home_insurance = params.fetch("query_housing_expenses__home_insurance")
    @budget_calculator.housing_expenses__repairs_maintenance = params.fetch("query_housing_expenses__repairs_maintenance")
    @budget_calculator.housing_expenses__water__gas__electricity = params.fetch("query_housing_expenses__water__gas__electricity")
    @budget_calculator.housing_expenses__cable__tv__internet = params.fetch("query_housing_expenses__cable__tv__internet")
    @budget_calculator.housing_expenses__phone_cell = params.fetch("query_housing_expenses__phone_cell")
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

    
    if @budget_calculator.valid?
      @budget_calculator.save

      redirect_to("/summary_step_1/" + @budget_calculator.id.to_s, { :notice => "Budget modified successfully."})
    else
      render({ :template => "budget_calculators/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_budget_calculator.destroy
    reset_session
    
    redirect_to("/summary_step_1/" + @budget_calculator.user_id.to_s, { :notice => "Budget deleted successfully" })
  end

  def summary_step_1
    the_id = params.fetch("user_id")
    @budgets = BudgetCalculator.where({:user_id => the_id }).at(0)

    @budget = BudgetCalculator.where({ :id => params.fetch(:budget_id)}).at(0)

    @monthly_budgets = @budget.inspect

    @housing_expenses_budget_1 = @budget.housing_expenses__mortgage.to_i + @budget.housing_expenses__hoa_fees.to_i + @budget.housing_expenses__home_insurance.to_i + @budget.housing_expenses__repairs_maintenance.to_i+@budget.housing_expenses__water__gas__electricity.to_i + @budget.housing_expenses__cable__tv__internet.to_i + @budget.housing_expenses__phone_cell.to_i + 
 
    @transportation_expenses_budget_2= @budget.transportation_expenses__car_payment.to_i + @budget.transportation_expenses__car_insurance.to_i + @budget.transportation_expenses__gas__fuel.to_i + @budget.transportation_expenses__car_repairs.to_i 
 
    @educational_expenses_budget_3=@budget.educational_expenses__college_tuition.to_i + @budget.educational_expenses__school_supplies.to_i +  @budget.educational_expenses__student_loans.to_i 
 
    @food_personal_expenses_budget_4=@budget.food_and_personal__groceries__household.to_i + @budget.food_and_personal__clothing.to_i + @budget.food_and_personal__entertainment.to_i +  @budget.food_and_personal__medical.to_i + @budget.food_and_personal__pet_supplies.to_i + @budget.food_and_personal__other_expenses.to_i
 
    @savings_investments_budget_5=@budget.monthly_savings__emergency_fund.to_i + @budget.monthly_savings__investments.to_i
    
    @monthly_budget = @housing_expenses_budget_1.to_f + @transportation_expenses_budget_2.to_f + @educational_expenses_budget_3.to_f + @food_personal_expenses_budget_4.to_f + @savings_investments_budget_5.to_f
    @annual_budget = @monthly_budget.to_f * 12


    render({ :template => "/budget_calculator_sessions/summary.html.erb"})
  end 
  
end
