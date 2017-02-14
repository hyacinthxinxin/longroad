Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help', as: 'helf'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'api/v1/login', to: 'api#login'
  get 'api/v1/project', to: 'api#project'
  get 'api/v1/buildings', to: 'api#buildings'
  
  # resources :users do
  #   resources :buildings do
  #     resources :floors
  #   end
  # end

  resources :users
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
