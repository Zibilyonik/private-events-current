Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :events
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
  get '/welcome', to: 'sessions#welcome'
  post '/welcome', to: 'sessions#welcome'
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
