Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/profile', to: 'pages#profile'
  get '/my_petitions', to: 'pages#my_petitions', as: "my_petitions"
  get "/my_sites", to: "pages#my_sites"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :collectors, only: %i[index show]
  resources :recycling_sites
  resources :petitions, only: %i[index create]
  patch "petitions/:id/accept", to: "petitions#accept_petition", as: "accept_petition"
  patch "petitions/:id/decline", to: "petitions#decline_petition", as: "decline_petition"
  patch "petitions/:id/do", to: "petitions#do_petition", as: "do_petition"
  patch "petitions/:id/accept_petition_site", to: "petitions#accept_petition_site", as: "accept_petition_site"
  patch "petitions/:id/decline_petition_site", to: "petitions#decline_petition_site", as: "decline_petition_site"
end
