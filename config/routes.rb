Rails.application.routes.draw do
  get 'categories/new'
  get 'categories/index'
  get 'categories/edit'
  get 'categories/update'
  get 'categories/delete'
  get 'categories/show'
  resources :users
  resources :categories
  resources :sessions, only: [:new, :create,:destroy]

  root 'static_pages#home'
  
  get 'static_pages/home'
  
  get '/home', to: 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/profile', to: 'users#show'
  get '/members', to: 'users#index'
  get '/settings', to: 'user#edit'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  get '/lessons', to: 'categories#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
