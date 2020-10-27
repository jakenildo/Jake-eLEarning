Rails.application.routes.draw do
  resources :answers
  resources :lessons
  resources :words
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :categories
  resources :sessions, only: [:new, :create,:destroy]

  resources :make_admin, only: [:show, :edit]

  resources :relationships, only: [:create, :destroy]

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
  get '/lessons', to: 'lessons#new'
  get '/category/:category_id/lesson_words/', to: 'answers#new', :as => :learn_lesson
  get '/category/:category_id/lesson/', to: 'answers#show', :as => :view_result
  get '/category/:category_id/lesson/', to: 'lessons#update', :as => :check
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
