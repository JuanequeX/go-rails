# frozen_string_literal: true

# Path: app/models/twitter_account.rb
class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets

  validates :username, presence: true, uniqueness: true
end
