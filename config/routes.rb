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

  # get 'carts/:id' => "carts#show", as: "cart"
  # delete 'carts/:id' => "carts#destroy"

  # post 'enrollments/:id/add' => "enrollments#add_quantity", as: "enrollments_add"
  # post 'enrollments' => "enrollments#create"
  # get 'enrollments/:id' => "enrollments#show", as: "enrollments_item"
  # delete 'enrollments_items/:id' => "enrollments#destroy" 


  # get "/courses/new", to: "courses#new"
  # get "/courses/:id", to: "courses#show"
  # get "/courses/delete/:id", to: "courses#delete"
  # post "/courses/new", to: "courses#new"

# Link from the Product index page (erb tags)
# button_to "Add to Account", enrollment_path(:course_id => course.id)

# Link from the Cart show (erb tags)
# post 'enrollments' => "enrollments#create"

# get 'enrollments/:id' => "enrollments#show", as: "enrollment"
# delete 'enrollments/:id' => "enrollments#destroy"

# post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
# post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"


end
