Rails.application.routes.draw do
  root to: 'users#new'
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts
  resources :users, only: [:new, :create, :show]
end
