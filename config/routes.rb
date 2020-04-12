Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    get 'follow', to: 'users#follow', as: 'follow'
  end

  root to: 'pages#home'
  get '/user/requests/', to: 'pages#requests', as: 'user_requests'

  resources :assignments, only: [:create, :destroy]
  resources :reviews, only: [:new, :create]

  resources :requests do
    get 'favorite', to: 'requests#favorite', as: 'favorite'
  end

  resources :chatrooms do
    resources :messages, only: :create
  end

end
