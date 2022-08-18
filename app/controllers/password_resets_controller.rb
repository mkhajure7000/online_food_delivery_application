class PasswordResetsController < ApplicationController

  def index; end

  def create 
    @user = User.find_by(email: params[:email])
      if @user.present?
        #send email
        PasswordMailer.with(user: @user).reset.deliver_now
      end
    redirect_to password_reset_path, notice: "If an account with that email was found, we have sent a link to reset your password"
  end
    
  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to login_path, alert: "Your token has expired, Please try it again"
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to login_path, notice: "Your Password was reset successfully, Please sign in."
    else
      render :edit  
    end
  end

  private 
    def password_params
      params.required(:user).permit(:password, :password_confirmation)
    end

end
