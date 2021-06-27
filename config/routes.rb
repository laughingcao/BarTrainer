Rails.application.routes.draw do

  root "welcome#welcome"

  get '/signup' => 'users#new'
  post '/signup' => 'users/#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :users
  resources :cocktails do
    resources :recipes
  end

end
