Rails.application.routes.draw do

  root "welcome#welcome"

  get '/signup' => 'users#new'
  post '/signup' => 'users/#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create '

  resources :users
  resources :cocktails
  resources :ingredients

end
