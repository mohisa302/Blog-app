Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  namespace :api do
    namespace :v1 do
      post :auth, to: 'authentication#create'
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: %i[index create]
        end
      end
    end
  end

  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, except: %i[update edit] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: [:create]
    end
  end
end
