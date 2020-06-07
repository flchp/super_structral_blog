Rails.application.routes.draw do
  devise_for :users
  root 'account/posts#index'
  namespace :account do
    resources :posts do
      member do
        post :set_as_public
        post :set_as_private
        post :set_as_model
        post :quit_set_as_model
      end
      collection do
        get :select_model_new
      end
    end
  end

  resources :posts do
    resources :comments
  end

  namespace :admin do
    resources :posts do
      member do
        post :set_as_hide
        post :set_as_display
      end
    end
  end

end
