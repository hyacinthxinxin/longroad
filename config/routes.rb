# frozen_string_literal: true
Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :admins
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  namespace :api do
    namespace :v2 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :buildings

      get :building_detail, to: 'buildings#building_detail'
    end
  end

  get  '/', to: 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  get 'api/v1/project', to: 'api#project'
  get 'api/v1/buildings', to: 'api#buildings'

  resources :buildings do
    resources :floors do
      put "move_higher", to: "floors#move_higher"
      put "move_lower", to: "floors#move_lower"
      resources :areas do
        put "move_higher", to: "areas#move_higher"
        put "move_lower", to: "areas#move_lower"
        post :dup_area
        resources :devices do
          put "move_higher", to: "devices#move_higher"
          put "move_lower", to: "devices#move_lower"
          post :dup_device
          resources :cams do
            put "move_higher", to: "cams#move_higher"
            put "move_lower", to: "cams#move_lower"
          end
        end
      end
    end
  end
end
