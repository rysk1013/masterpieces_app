Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users
  resources :post, only: [:index, :new, :create]
end
