Rails.application.routes.draw do
  root 'static_pages#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#fbcreate'
  post '/logout', to: 'sessions#destroy'
  get '/search', to: 'application#search'
  post '/search', to: 'application#result'
  get '/price_sort', to: 'listings#price_sort'

  resources :users do
    resources :listings, only: [:new, :edit, :show, :destroy]
  end
  resources :albums do
    get 'by_artist/:artist' => :artist, on: :collection
  end
  resources :listings, only: [:create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
