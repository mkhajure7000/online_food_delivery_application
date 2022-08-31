class PasswordsController < ApplicationController
  before_action :require_password, only: %i[edit update]

  def index; end

  def create 
    @user = User.find_by(email: params[:email])
    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    flash[:notice] = "If an account with that email was found, we have sent a link to reset your password"
    redirect_to password_path
  end

  def edit
    rescue ActiveSupport::MessageVerifier::InvalidSignature
    flash[:alert] = "Your token has expired, Please try it again"
    redirect_to new_session_path
  end

  def update
    if @user.update(password_params)
      flash[:notice] = "Your Password was reset successfully, Please sign in."
      redirect_to new_session_path
    else
      render :edit  
    end
  end

  private 
  def password_params
    params.required(:user).permit(:password, :password_confirmation)
  end

  def require_password
    @user =  current_user.find_signed!(params[:token], purpose: "password_reset")
  end

end
