Rails.application.routes.draw do
  root "home#index"

  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :dashboard, only: [:index]
  resources :stars, only: [:index]
  resources :followers, only: [:index]
  resources :following, only: [:index]
end
