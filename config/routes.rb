Rails.application.routes.draw do
  devise_for :users
  root 'account/posts#index'
  namespace :account do
    resources :posts
  end

  resources :posts
end
