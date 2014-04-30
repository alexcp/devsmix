Rails.application.routes.draw do
  root to: "home#index"

  get 'login', to: redirect("/auth/github"), as: :login
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
