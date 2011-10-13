module SessionsHelper

  def store_location
    session[:return_to] = request.fullpath
    clear_return_to
  end

  private

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
  end

  def clear_return_to
    session[:return_to] = nil
  end
end
