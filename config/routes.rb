Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations' }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root 'pages#home'
  resources :users do
    member do
      get :following, :followers
    end
  end
  post "likes/:post_id/create", to: "likes#create"
  post "likes/:post_id/destroy", to: "likes#destroy"
  resources :users,         only: [:show, :index]
  resources :microposts,    only: [:create, :destroy, :index, :show] do
    resources :comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
