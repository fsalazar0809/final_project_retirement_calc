class BudgetCalculatorSessionsController < ApplicationController
  # skip_before_action(:force_budget_calculator_sign_in, { :only => [:new_session_form, :create_cookie] })

  def new_session_form
    render({ :template => "budget_calculator_sessions/sign_in.html.erb" })
  end

  def create_cookie
    budget_calculator = BudgetCalculator.where({ :email => params.fetch("query_email") }).at(0)
    
    the_supplied_password = params.fetch("query_password")
    
    if budget_calculator != nil
      are_they_legit = budget_calculator.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/user_sign_in", { :alert => "Incorrect password." })
      else
        session.store(:budget_calculator_id, budget_calculator.id)
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/user_sign_in", { :alert => "No budget_calculator with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
