# frozen_string_literal: true

# Path: app/controllers/omniauth_callbacks_controller.rb
class OmniauthCallbacksController < ApplicationController
  def twitter
    render plain: 'Success your twitter account is linked!'
  end
end
