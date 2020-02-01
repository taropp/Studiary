Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'pages#home'
  get '/', to: 'pages#show'
  resources :users, only: [:show, :index]
end