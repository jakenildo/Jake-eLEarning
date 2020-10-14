Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create,:destroy]

  root 'static_pages#home'
  
  get 'static_pages/home'
  get 'static_pages/setting'
  
  get '/home', to: 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/profile', to: 'users#show'
  get '/members', to: 'users#index'
  
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
