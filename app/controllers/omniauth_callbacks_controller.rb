# frozen_string_literal: true

# Path: app/controllers/omniauth_callbacks_controller.rb
class OmniauthCallbacksController < ApplicationController
  before_action :require_user_logged_in!

  def twitter
    Rails.logger.info("🔥🔥🔥 #{auth} 🔥🔥🔥")
    update_or_create_twitter_account
    redirect_to root_path, notice: 'Successfully connected your account!'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def update_or_create_twitter_account
    twitter_account = find_or_initialize_twitter_account

    update_twitter_account_attributes(twitter_account)

    twitter_account.save!
  end

  def find_or_initialize_twitter_account
    Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
  end

  def update_twitter_account_attributes(twitter_account)
    twitter_account.assign_attributes(
      name: auth.info.name,
      username: auth.info.nickname,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )
  end
end
