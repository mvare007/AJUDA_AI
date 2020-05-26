Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    get 'follow', to: 'users#follow', as: 'follow'
  end

  root to: 'pages#home'
  get '/user/requests/', to: 'pages#requests', as: 'user_requests'
  get '/search/', to: 'pages#search', as: 'search'

  resources :assignments, only: [:create, :update, :destroy]
  resources :reviews, only: [:new, :create]

  resources :requests do
    get 'favorite', to: 'requests#favorite', as: 'favorite'
  end

  resources :chatrooms, only: [:index, :show, :destroy] do
    resources :messages, only: :create
  end
end
