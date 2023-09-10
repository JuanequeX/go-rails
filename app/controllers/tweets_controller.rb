# frozen_string_literal: true

# Path: app/controllers/tweets_controller.rb
class TweetsController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Current.user.tweets.new
  end
end
