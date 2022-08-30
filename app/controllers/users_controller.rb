class UsersController < ApplicationController
  
  def index; end
    
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_session_path
    else 
      render :new, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :contact_number, :password, :is_admin)
  end
    
end
