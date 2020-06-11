Rails.application.routes.draw do
  resources :users
  resources :sessions
  resources :events do
    member do
      post 'attend'
      post 'withdraw'
    end
  end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  post '/logout', to: 'sessions#destroy'
  get '/welcome', to: 'sessions#welcome'
  post '/welcome', to: 'sessions#welcome'
  root to: 'sessions#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
