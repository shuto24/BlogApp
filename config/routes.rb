Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, only: [:new, :create]
  devise_for :users
end
