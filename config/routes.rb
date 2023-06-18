Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :farms, only: [:index, :show, :new, :create] do
    resources :tomatoes, only: [:new, :create]
    resources :wheats, only: [:new, :create]
    resources :cows, only: [:new, :create]
    resources :chickens, only: [:new, :create]
  end

end
