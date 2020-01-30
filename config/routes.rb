Rails.application.routes.draw do
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
end