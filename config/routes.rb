Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users
  resources :users, only: [:show]
  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
