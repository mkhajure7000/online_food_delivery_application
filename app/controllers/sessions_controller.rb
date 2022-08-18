class SessionsController < ApplicationController
    
  def index; end
  
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
        # redirect_to '/', notice: "login successfully"
      if @user.is_admin
        redirect_to restaurants_path
      else
        redirect_to users_path 
      end
    else
      redirect_to login_path, notice: "Invalid email or password"
    end
  end
    
  def destroy
    session[:user_id] = nil 
    lash[notice] = "log out "
    redirect_to root_path, notice: "Logged out"
  end

  end
