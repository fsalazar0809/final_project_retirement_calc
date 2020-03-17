class PersonalInformationsController < ApplicationController
  # skip_before_action(:force_personal_information_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "personal_information_sessions/sign_up.html.erb" })
  end

  def create
    @personal_information = PersonalInformation.new
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
    render({ :template => "personal_informations/edit_profile.html.erb" })
  end

  def update
    @personal_information = @current_personal_information
    @personal_information.current_age = params.fetch("query_current_age")
    @personal_information.retirement_age = params.fetch("query_retirement_age")
    @personal_information.retirement_savings = params.fetch("query_retirement_savings")
    @personal_information.return_on_savings = params.fetch("query_return_on_savings")
    @personal_information.life_expectancy = params.fetch("query_life_expectancy")
    @personal_information.monthly_contribution = params.fetch("query_monthly_contribution")
    @personal_information.user_id = params.fetch("query_user_id")
    @personal_information.budget_id = params.fetch("query_budget_id")
    
    if @personal_information.valid?
      @personal_information.save

      redirect_to("/", { :notice => "Personal information account updated successfully."})
    else
      render({ :template => "personal_informations/edit_profile_with_errors.html.erb" })
    end
  end

  def summary_step_2
    @personal_information_demographic = PersonalInformation.where({ :id => params.fetch(:id)}).at(0)

    @information_demo = @personal_information_demographic.inspect
    @retirement_age = @personal_information_demographic.retirement_age.to_i
    @current_age = @personal_information_demographic.current_age.to_i
    @number_of_years_to_save = @personal_information_demographic.retirement_age.to_i - @personal_information_demographic.current_age.to_i
   
    render({ :template => "/budget_calculator_sessions/summary_2.html.erb"})
  end 

  def destroy
    @current_personal_information.destroy
    reset_session
    
    redirect_to("/", { :notice => "PersonalInformation account cancelled" })
  end
  
end
