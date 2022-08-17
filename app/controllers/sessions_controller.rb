class SessionsController < ApplicationController
    
    def new
    end

    def create
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        # redirect_to '/', notice: "login successfully"
        if @user.is_admin
          redirect_to '/restaurants'
        else
          redirect_to '/users'
        end
      else
        redirect_to '/users/new'
      end
    end
    
    def destroy
      session[:user_id] = nil 
      flash[notice] = "log out "
      redirect_to root_path, notice: "Logged out"
    end
  end