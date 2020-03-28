Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    get 'follow', to: 'users#follow', as: 'follow'
  end


  root to: 'pages#home'
  get '/user/requests/', to: 'pages#requests', as: 'user_requests'

  resources :requests do
    get 'favorite', to: 'requests#favorite', as: 'favorite'
  end

  resources :assignments, only: [:create, :destroy]
  resources :reviews, only: [:new, :create]

end
