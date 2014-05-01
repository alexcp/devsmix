Rails.application.routes.draw do

  resources :playlists, except: :index

  resources :users, only: :show

  root to: "home#index"

  # Omniauth
  get 'login', to: redirect("/auth/github"), as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
