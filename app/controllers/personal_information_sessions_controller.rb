class PersonalInformationSessionsController < ApplicationController
  # skip_before_action(:force_personal_information_sign_in, { :only => [:new_session_form, :create_cookie] })

  def new_session_form
    render({ :template => "personal_information_sessions/sign_in.html.erb" })
  end




  def create_cookie
    personal_information = PersonalInformation.where({ :email => params.fetch("query_email") }).at(0)
    
    the_supplied_password = params.fetch("query_password")
    
    if personal_information != nil
      are_they_legit = personal_information.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/personal_information_sign_in", { :alert => "Incorrect password." })
      else
        session.store(:personal_information_id, personal_information.id)
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/personal_information_sign_in", { :alert => "No personal_information with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
