Rails.application.routes.draw do
  delete '/:name/artists/:id', to: 'artists#destroy'
  get '/:name/artists', to: 'artists#index'
  post '/login', to: 'users#create'
  delete "/logout", to: "sessions#destroy", as: "logout"
  get '/currentuser', to: "sessions#get_current_user"
  post '/token', to: 'sessions#set_token'
  get '/token', to: 'sessions#get_token'
  resources :users #do --- next step nest artists under users
    resources :artists
  #end
    #resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
