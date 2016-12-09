Rails.application.routes.draw do
  root 'static_pages#home'
  get 'help', to: 'static_pages#help'

  get 'sessions/new'

  get 'users/new'

  resources :teams
  resources :users

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
