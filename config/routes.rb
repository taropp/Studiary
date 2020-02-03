Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'pages#home'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users,      only: [:show, :index]
  resources :microposts, only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end