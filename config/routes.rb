# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tracks
    end
  end
  resources :tracks
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  require 'sidekiq/web'

  scope :monitoring do
    # Sidekiq Basic Auth from routes on production environment
    if Rails.env.production?
      Sidekiq::Web.use Rack::Auth::Basic do |username, password|
        ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username),
                                                    ::Digest::SHA256.hexdigest(Rails.application.credentials.sidekiq[:auth_username])) &
          ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password),
                                                      ::Digest::SHA256.hexdigest(Rails.application.credentials.sidekiq[:auth_password]))
      end
    end
    mount Sidekiq::Web, at: '/sidekiq'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :users do
        post :login
        delete :logout
        get :me, :home
        post :create
        put :update
      end

      get '/users/:id', to: "users#show" #constraints: {username: /.*/} # the constraints allows for . in username
      put '/users/:id', to: "users#update"

      resources :users, :only => [:update]

      resources :users do
        resources :friendships, only: %i[create]
      end

      #add resources for playlist
      namespace :playlists do
        get :home
      end
      resources :playlists do 
        resources :likes, only: %i[create] #added for usage with "likes" on these models 4/21/23
      end
      
      #tracks resources
      resources :tracks do
        resources :likes, only: %i[create]
      end

      resources :posts do
        resources :likes, only: %i[create]
      end
      resources :comments do
        resources :likes, only: %i[create]
      end
      resources :replies do
        resources :likes, only: %i[create]
      end
      
    end
  end
end
