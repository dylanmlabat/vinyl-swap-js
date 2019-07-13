Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users do
    resources :listings, only: [:new, :show]
  end
  resources :albums
  resources :listings, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
