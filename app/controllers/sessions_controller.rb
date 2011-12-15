class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to :back, :notice => "Signed in!"
  rescue ActionController::RedirectBackError
    redirect_to :root
  end

  def destroy
    session[:user_id] = nil
    redirect_to :back, :notice => "Signed out!"
  rescue ActionController::RedirectBackError
    redirect_to :root
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end
