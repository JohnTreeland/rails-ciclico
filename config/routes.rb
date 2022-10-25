Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/profile', to: 'pages#profile'

  # Defines the root path route ("/")
  # root "articles#index"
  resources :collectors, only: %i[index show]
  resources :recycling_sites
  resources :petitions, only: %i[index new create]
end
