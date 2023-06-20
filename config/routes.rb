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
    post 'water_tomato', to: 'farms#water_tomato', on: :member
    post 'water_wheat', to: 'farms#water_wheat', on: :member

    member do
      post 'feed_chicken', to: 'farms#feed_chicken', as: :feed_chicken_farm
      post 'feed_cow', to: 'farms#feed_cow', as: :feed_cow_farm
    end
  end

end
