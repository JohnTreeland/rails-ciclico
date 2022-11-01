Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/profile', to: 'pages#profile'
  get '/profile_collector', to: 'pages#profile_collector', as: "profile_collector"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :collectors, only: %i[index show]
  resources :recycling_sites
  resources :petitions, only: %i[index new create]
  patch "petitions/:id/accept", to: "petitions#accept_petition", as: "accept_petition"
  patch "petitions/:id/decline", to: "petitions#decline_petition", as: "decline_petition"
end
