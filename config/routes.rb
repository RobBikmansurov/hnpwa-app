require 'sidekiq/web'

Rails.application.routes.draw do

  namespace :manage do
    mount Sidekiq::Web => '/sidekiq'
    Sidekiq::Web.set :session_secret, Rails.application.credentials.dig(:secret_key_base)
  end

  resource :top
  root "tops#show"
end