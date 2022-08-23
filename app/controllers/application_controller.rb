class ApplicationController < ActionController::Base
  
  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  
  def require_password
    @user =  current_user.find_signed!(params[:token], purpose: "password_reset")
  end
  
  helper_method :current_user

end
