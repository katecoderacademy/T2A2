Rails.application.routes.draw do
  # get 'courses/index'
  # get 'courses/show'
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :courses
  root to: "courses#index"
  # get "/courses/new", to: "courses#new"
  # get "/courses/:id", to: "courses#show"
  # get "/courses/delete/:id", to: "courses#delete"
  # post "/courses/new", to: "courses#new"


end
