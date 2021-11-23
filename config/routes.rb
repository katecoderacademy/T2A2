Rails.application.routes.draw do
  # get 'courses/index'
  # get 'courses/show'
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
  end

  devise_for :users
  resources :courses, :enrollments
  root to: "courses#index"

  get 'postedcourses' => "courses#posted"
  get 'search' => "courses#search"

end
