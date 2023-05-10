Rails.application.routes.draw do
  get 'users/', to: 'users#index'
  get 'users/:id', to: 'users#show'
  get 'users/:id/posts', to: 'posts#index'
  get 'users/:id/posts/:id', to: 'posts#show'
  # Defines the root path route ("/")
  # root "articles#index"
end
