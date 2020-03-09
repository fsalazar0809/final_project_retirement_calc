Rails.application.routes.draw do



  # Routes for the Budget calculator account:

  # SIGN UP FORM
  get("/budget_calculator_sign_up", { :controller => "budget_calculators", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_budget_calculator", { :controller => "budget_calculators", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_budget_calculator_profile", { :controller => "budget_calculators", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_budget_calculator", { :controller => "budget_calculators", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_budget_calculator_account", { :controller => "budget_calculators", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/budget_calculator_sign_in", { :controller => "budget_calculator_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/budget_calculator_verify_credentials", { :controller => "budget_calculator_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/budget_calculator_sign_out", { :controller => "budget_calculator_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Personal information account:

  # SIGN UP FORM
  get("/personal_information_sign_up", { :controller => "personal_informations", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_personal_information", { :controller => "personal_informations", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_personal_information_profile", { :controller => "personal_informations", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_personal_information", { :controller => "personal_informations", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_personal_information_account", { :controller => "personal_informations", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/personal_information_sign_in", { :controller => "personal_information_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/personal_information_verify_credentials", { :controller => "personal_information_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/personal_information_sign_out", { :controller => "personal_information_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "users", :action => "new_registration_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "users", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "users", :action => "edit_registration_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "users", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "users", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_sessions", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_sessions", :action => "destroy_cookies" })
             
  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
