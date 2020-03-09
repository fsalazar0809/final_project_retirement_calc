ActiveAdmin.register PersonalInformation do
  permit_params :email, :password_digest, :current_age, :retirement_age, :retirement_savings, :return_on_savings, :life_expectancy, :monthly_contribution, :user_id, :budget_id


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
