Rails.application.routes.draw do

  root "sessions#welcome"
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/users/:id/cocktails' => 'users#cocktails'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users/#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy' 
  get '/users/:id/cocktails' => 'users#cocktails'
  
  resources :users, only: [:show, :new, :create, :cocktails]
  resources :cocktails
  resources :users  do
    resources :cocktails, only: [:new, :create, :edit, :destroy, :show, :update, :index]
  end 

end
