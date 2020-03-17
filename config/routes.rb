Rails.application.routes.draw do


  #PAGE AFTER SIGN IN and SIGN UP 
  get("/homepage", { :controller => "users", :action => "homepage" })

  # Routes for the User account:

  #HOMEPAGE

   get("/", { :controller => "user_sessions", :action => "new_session_form" })      


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

  #NEW PERSONAL INFORMATION

    get("/personal_information_sign_up", { :controller => "personal_informations", :action => "new_registration_form" })
    
    get("/summary_step_2/:id", { :controller => "personal_informations", :action => "summary_step_2" })
     
    get("/budget_sign_up", { :controller => "budget_calculators", :action => "budget_information" }) 

    get("/summary_step_1/:budget_id", { :controller => "budget_calculators", :action => "summary_step_1" }) 

    post("/insert_personal_information", { :controller => "personal_informations", :action => "create"  })

    post("/insert_budget_calculator", { :controller => "budget_calculators", :action => "create"  })



  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
