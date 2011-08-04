class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid_and_email(auth["provider"], auth["uid"], auth["user_info"]["email"]) || User.create_with_omniauth(auth)   
      if user.save! == false
        session[:auth] = auth.except('extra')
        render :action => 'register'        #this is a good place to render registration in a pop-up window or somehow javascript drop-down to let people enter email address
      end   
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Signed in!"
    end

  def register
    @user = User.find(session[:auth])
    
    respond_to do |format|
      if @user.update_email(params[:session][:email])
        format.html { render :action => 'create' }
      end
    end
  end
    
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
