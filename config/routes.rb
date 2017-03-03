Rails.application.routes.draw do
  root 'static_pages#index'

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
    end    
  end
  
  get  '/',    to: 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  get 'api/v1/project', to: 'api#project'
  get 'api/v1/buildings', to: 'api#buildings'
  
  resources :buildings do
    resources :floors do 
      resources :areas do
        resources :devices do
          resources :cams do
            end
        end
      end 
    end
  end

end
