Rails.application.routes.draw do

  root "welcome#welcome"

  get '/signup' => 'users#new'
  post '/signup' => 'users/#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'
  resources :cocktails
  resources :users, only: [:show, :new, :create]

  resources :users  do
    resources :cocktails, only: [:new, :create, :edit, :destroy, :show, :update, :index]
  end
  resources :cocktails do
    resources :recipes, only: [:new, :create, :edit, :destroy, :show, :update, :index]
  end

end
