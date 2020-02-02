Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'pages#home'
  resources :users,      only: [:show, :index]
  resources :microposts, only: [:create, :destroy]
end