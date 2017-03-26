Rails.application.routes.draw do
  root "home#index"
  # get "/login/oauth/authorize", to: 'dashboard#index'
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  namespace :user, path: ':user' do
    get '/dashboard', to: 'dashboard#index'
    get '/stars', to: 'stars#index'
    get '/followers', to: 'followers#index'
    get '/following', to: 'following#index'
    get '/repos', to: 'repos#index'
    get '/organizations', to: 'organizations#index'
    get '/events', to: 'events#index'


  # resources :dashboard, only: [:index]
  # resources :stars, only: [:index]
  # resources :followers, only: [:index]
  # resources :following, only: [:index]
  # resources :repos, only: [:index]
  # resources :organizations, only: [:index]
  # resources :events, only: [:index]
  end
end
