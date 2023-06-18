Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :farms, only: [:index, :show, :new, :create] do
    post 'add_tomato', on: :member
    post 'add_wheat', on: :member
    post 'add_cow', on: :member
    post 'add_chicken', on: :member
  end
end
