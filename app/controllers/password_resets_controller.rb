# frozen_string_literal: true

# Path: app/controllers/password_resets_controller.rb
class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])
    PasswordMailer.with(user: @user).reset.deliver_now if @user.present?
    redirect_to root_path, notice: 'If an account was found, verify email to reset your password.'
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: 'Your token has expired. Please try again.'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')

    if @user.update(password_params) && password_params[:password].present?
      redirect_to sign_in_path, notice: 'Your password was reset successfully. Please sign in.'
    else
      flash.now[:alert] = 'The password fields cannot be blank.'
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
