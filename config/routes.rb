# frozen_string_literal: true

# Path: config/routes.rb
Rails.application.routes.draw do
  get 'about-us', to: 'about#index', as: :about

  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'

  get 'password/reset', to: 'password_resets#new', as: :new_password_reset
  post 'password/reset', to: 'password_resets#create', as: :password_reset
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'auth/twitter/callback', to: 'omniauth_callbacks#twitter'

  resources :twitter_accounts

  root 'main#index'
end
