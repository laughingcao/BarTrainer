Rails.application.routes.draw do

  root "sessions#welcome"
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/auth/google_oath2/callback' => 'sessions#omiauth'

  get '/signup' => 'users#new'
  post '/signup' => 'users/#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy' 
  
  resources :users, only: [:show, :new, :create]

  resources :users  do
    resources :cocktails, only: [:new, :create, :edit, :destroy, :show, :update, :index]
  end
  resources :cocktails do
    resources :recipes, only: [:new, :create, :edit, :destroy, :show, :update, :index]
  end

end
