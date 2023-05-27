Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#index'

  mount LetterOpenerWeb::Engine, at: '/letter_opener'

  get '/users', to: 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create destroy] do
      resources :comments, only: %i[new create destroy], shallow: true
      resources :likes, only: [:create]
    end
  end
  delete '/users/:user_id/posts/:post_id/comments/:id', to: 'comments#destroy', as: 'user_post_comment'
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show create] do
        resources :posts, only: %i[index show create] do
          resources :comments, only: %i[index show create]
        end
      end
    end
  end
end
