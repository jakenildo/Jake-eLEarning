Rails.application.routes.draw do
  resources :lessons
  resources :words
  resources :users
  resources :categories
  resources :sessions, only: [:new, :create,:destroy]

  resources :make_admin, only: [:show, :edit]

  root 'static_pages#home'
  
  get 'static_pages/home'

  get '/home', to: 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/profile', to: 'users#show'
  get '/members', to: 'users#index'
  get '/settings', to: 'user#edit'

  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  get '/admin', to: 'categories#index'
  get '/new_lesson', to: 'categories#new'

  get '/categories/:category_id/words', to: 'words#index', :as => :categ_words
  get '/categories/:category_id/words/new', to: 'words#new', :as => :new_categ_words
  get '/lessons', to: 'lessons#index'
  get '/lessons/:category_id/lesson_words/', to: 'lessons#show', :as => :learn_lesson
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
