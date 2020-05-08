Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts
  resources :users
  devise_for :users
end
