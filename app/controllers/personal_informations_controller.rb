class PersonalInformationsController < ApplicationController
  # skip_before_action(:force_personal_information_sign_in, { :only => [:new_registration_form, :create] })
  
  
  def new_registration_form
    render({ :template => "personal_information_sessions/sign_up.html.erb" })
  end

  def create
    @personal_information = PersonalInformation.new
    @personal_information.user_id = @current_user.id
    @personal_information.budget_id = @current_budget_calculator.id
  

    @personal_information.current_age = params.fetch("query_current_age")
    @personal_information.retirement_age = params.fetch("query_retirement_age")
    @personal_information.return_on_savings = params.fetch("query_return_on_savings")
    @personal_information.life_expectancy = params.fetch("query_life_expectancy")
    @personal_information.monthly_retirement_savings = params.fetch("query_monthly_retirement_savings")
    @personal_information.inflation_rate = params.fetch("query_inflation_rate")

    save_status = @personal_information.save

    if save_status == true
      session.store(:personal_information_id,  @personal_information.id)
   
      redirect_to("/summary_step_2/" + @personal_information.id.to_s, { :notice => "Personal information saved successfully."})
    else
      redirect_to("/personal_information_sign_up", { :alert => "Personal information account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    @personal_information = PersonalInformation.where({:id => @current_personal_information.id}).at(0)
    render({ :template => "personal_informations/edit_profile.html.erb" })
  end

  def update
    @personal_information = PersonalInformation.where({:id => @current_personal_information.id}).at(0)
    @personal_information.current_age = params.fetch("query_current_age")
    @personal_information.retirement_age = params.fetch("query_retirement_age")
    @personal_information.return_on_savings = params.fetch("query_return_on_savings")
    @personal_information.life_expectancy = params.fetch("query_life_expectancy")
    @personal_information.monthly_retirement_savings = params.fetch("query_monthly_retirement_savings")
    @personal_information.inflation_rate = params.fetch("query_inflation_rate")
    
    if @personal_information.valid?
      @personal_information.save

      redirect_to("/summary_step_2/" + @personal_information.id.to_s, { :notice => "Personal information account updated successfully."})
    else
      render({ :template => "personal_informations/edit_profile_with_errors.html.erb" })
    end
  end

  def summary_step_2
    @personal_information_demographic = PersonalInformation.where({ :id => params.fetch(:id)}).at(0)

    @information_demo = @personal_information_demographic.inspect
    @retirement_age = @personal_information_demographic.retirement_age.to_i
    @current_age = @personal_information_demographic.current_age.to_i
    @life_expectancy =  @personal_information_demographic.life_expectancy.to_i
    @number_of_years_in_retirement = @personal_information_demographic.life_expectancy.to_i - @personal_information_demographic.retirement_age.to_i
    @number_of_years_to_save = @personal_information_demographic.retirement_age.to_i - @personal_information_demographic.current_age.to_i
    @monthly_retirement_savings = @personal_information_demographic.monthly_retirement_savings.to_i
    @annual_retirement_savings = @monthly_retirement_savings * 12
    @expected_growth_rate = @personal_information_demographic.return_on_savings.to_f - @personal_information_demographic.inflation_rate.to_f
    
    
    @value_of_savings_at_retirement= @annual_retirement_savings * ((1+(@expected_growth_rate/100))** @number_of_years_to_save)
   
    
    @a = @personal_information_demographic.budget_id
    @b = BudgetCalculator.where({:id => @a}).at(0)

    @housing_expenses_budget_1 = @b.housing_expenses__mortgage.to_i + @b.housing_expenses__hoa_fees.to_i + @b.housing_expenses__home_insurance.to_i + @b.housing_expenses__repairs_maintenance.to_i+@b.housing_expenses__water__gas__electricity.to_i + @b.housing_expenses__cable__tv__internet.to_i + @b.housing_expenses__phone_cell.to_i 
 
    @transportation_expenses_budget_2= @b.transportation_expenses__car_payment.to_i + @b.transportation_expenses__car_insurance.to_i + @b.transportation_expenses__gas__fuel.to_i + @b.transportation_expenses__car_repairs.to_i 
 
    @educational_expenses_budget_3=@b.educational_expenses__college_tuition.to_i + @b.educational_expenses__school_supplies.to_i +  @b.educational_expenses__student_loans.to_i 
 
    @food_personal_expenses_budget_4=@b.food_and_personal__groceries__household.to_i + @b.food_and_personal__clothing.to_i + @b.food_and_personal__entertainment.to_i +  @b.food_and_personal__medical.to_i + @b.food_and_personal__pet_supplies.to_i + @b.food_and_personal__other_expenses.to_i
 
    @savings_investments_budget_5=@b.monthly_savings__emergency_fund.to_i + @b.monthly_savings__investments.to_i
    
    @monthly_budget = @housing_expenses_budget_1.to_f + @transportation_expenses_budget_2.to_f + @educational_expenses_budget_3.to_f + @food_personal_expenses_budget_4.to_f + @savings_investments_budget_5.to_f
    @annual_budget = @monthly_budget.to_f * 12
    
    @number_of_years_covered_for_retirement = @value_of_savings_at_retirement / @annual_budget
    
    
    
    
    
    
    render({ :template => "/budget_calculator_sessions/summary_2.html.erb"})
  end 

  def destroy
    @current_personal_information.destroy
    reset_session
    
    redirect_to("/", { :notice => "PersonalInformation account cancelled" })
  end

  def testing
    @personal_information = PersonalInformation.where({:id => params.fetch(:id)}).at(0)
    @expenses = BudgetCalculator.where({ :id => @personal_information.budget_id}).at(0)

    #create a blank view, render on front end, on render page call 54 & 55 --> instance variables @expenses.inspect#
  
    render({ :template => "/budget_calculator_sessions/summary_2.html.erb"})
  end 
  
end
