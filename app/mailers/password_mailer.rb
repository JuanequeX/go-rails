# frozen_string_literal: true

# Path: app/mailers/password_mailer.rb
class PasswordMailer < ApplicationMailer
  # app/views/password_mailer/reset.html.erb
  def reset
    @token = params[:user].signed_id(purpose: 'password_reset', expires_in: 15.minutes)

    mail to: params[:user].email
  end
end
