Rails.application.routes.draw do
  root 'home#index'
  get 'users/:id', to: 'users#show'
  # Defines the root path route ("/")
  # root "articles#index"
end
