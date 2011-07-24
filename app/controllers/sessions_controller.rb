class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid_and_email(auth["provider"], auth["uid"], auth["user_info"]["email"])
    user = User.create_with_omniauth(auth)
      if user.email.blank?
        redirect_to "registrations"
        # this is where we need to get Email from users for Twitter
      else
        session[:user_id] = user.id
        redirect_to root_url, :notice => "Signed in!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
