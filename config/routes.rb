Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]

  root to: 'pages#home'
  get '/user/requests/', to: 'pages#requests', as: 'user_requests'

  resources :requests
  resources :assignments, only: [:create, :destroy]
  resources :reviews, only: [:new, :create]

end
