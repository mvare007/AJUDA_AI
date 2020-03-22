Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'

  resources :requests
  resources :request_user, only: [:create]
  resources :reviews, only: [:new, :create]

end
