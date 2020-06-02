Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/create'
  get 'event/index'
  get 'event/show'
  get 'event/new'
  get 'event/create'
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
