# frozen_string_literal: true

# Path: app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    # If the user is already logged in, redirect them to the root page.
    return unless session[:user_id]

    redirect_to root_path
  end

  def create
    # Find the user by their email address
    user = User.find_by(email: params[:email])
    # If the user exists AND the password entered is correct.
    if user.present? && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      # Redirect to the root page with a notice.
      redirect_to root_path, notice: 'Succesfully logged in!'
    else
      # If user's login doesn't work, send them back to the login form.
      flash[:alert] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Succesfully logged out!'
  end
end
