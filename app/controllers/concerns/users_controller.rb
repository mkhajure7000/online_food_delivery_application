class UsersController < ApplicationController

  def index

  end
    
  def new
    @user = User.new()
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/login'
    else 
      flash[:register_errors] = @user.errors.full_messages
      redirect_to '/'
    end
  end

    private
      def user_params
        params.require(:user).permit(:name, :email, :contact_number, :password, :is_admin)
      end
    
end