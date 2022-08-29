class SessionsController < ApplicationController

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.is_admin
        redirect_to restaurants_path
      else
        redirect_to users_path 
      end
    else
      redirect_to new_session_path
      flash[:errors] = "invalid password or email"
    end
  end
    
  def destroy
    session[:user_id] = nil
    flash[:notice] = "logout"
    redirect_to root_path
  end
end
