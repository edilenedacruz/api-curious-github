Rails.application.routes.draw do
  root "home#index"
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
  end
end
