class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid_and_email(auth["provider"], auth["uid"], auth["user_info"]["email"]) || user = User.create_with_omniauth(auth)   
    if user.email.nil?
        session[:user_id] = user.id
        session[:auth] = auth.except('extra')
        redirect_to :registration #and return if user.email
        #this is a good place to render registration in a pop-up window or somehow javascript drop-down to let people enter email address
    elsif   
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Signed in!"
    end
  end

  def register
    @user = User.find(session[:user_id])
              logger.debug session[:use_id].inspect

    respond_to do |format|
      if @user.update_attributes(params[:email])
        format.html { render 'sessions/register' }
        format.xml { head :ok }
        if @user.save
          redirect_to root_url, :notice => "Signed in!"
        end
      end
    end
  end

    
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
