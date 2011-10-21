class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to :back, :notice => "Signed in!" #this is breaking the authentication referrer
  end

  def destroy
    session[:user_id] = nil
    redirect_to :back, :notice => "Signed out!"
  end
end
