# frozen_string_literal: true

# Path: app/models/tweet.rb
class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account
end
