class PasswordsController < ApplicationController
  before_action :require_user_logged_in!

  def edit; end

  def update
    if Current.user.update(password_params) && password_params[:password].present?
      redirect_to root_path, notice: "Password updated successfully!"
    else
      flash.now[:alert] = "The password fields cannot be blank."
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
