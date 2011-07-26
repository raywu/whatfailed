class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid_and_email(auth["provider"], auth["uid"], auth["user_info"]["email"]) || User.create_with_omniauth(auth)
      if user.email.blank?
        session[:auth] = auth.except('extra')
        render :action => 'registrations'and return if user.email.blank? false
        #this is a good place to render registration in a pop-up window or somehow javascript drop-down to let people enter email address
    end
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end


  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
