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
      flash.now[:errors] = "invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end
    
  def destroy
    flash[:notice] = "logout"
    session[:user_id] = nil
    redirect_to root_path
  end
end
