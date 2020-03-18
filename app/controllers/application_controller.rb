class ApplicationController < ActionController::Base
  before_action(:load_current_budget_calculator)
  
  def index
    @user_id_url = session.fetch(:user_id)
    @budgets = BudgetCalculator.where({ :user_id => :user_id_url }).at(0)

    render({ :template => "/budget_calculators/index.html.erb" })
  end
  # before_action(:force_budget_calculator_sign_in)
  
  def load_current_budget_calculator
    the_id = session.fetch(:budget_calculator_id)
    @current_budget_calculator = BudgetCalculator.where({ :id => the_id }).at(0)
  end
  
  def force_budget_calculator_sign_in
    if @current_budget_calculator == nil
      redirect_to("/budget_calculator_sign_in", { :notice => "You have to sign in first." })
    end
  end

  before_action(:load_current_personal_information)
  
  # before_action(:force_personal_information_sign_in)
  
  def load_current_personal_information
    the_id = session.fetch(:personal_information_id)
    @current_personal_information = PersonalInformation.where({ :id => the_id }).at(0)
  end
  
  def force_personal_information_sign_in
    if @current_personal_information == nil
      redirect_to("/personal_information_sign_in", { :notice => "You have to sign in first." })
    end
  end

  before_action(:load_current_user)
  
  # before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session.fetch(:user_id)
    @current_user = User.where({ :id => the_id }).at(0)
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
