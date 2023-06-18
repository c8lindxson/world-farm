Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :farm, only: [:index, :show, :new, :create] do
    resources :tomato, only: [:index, :new, :create]
    resources :potato, only: [:index, :new, :create]
    resources :cow, only: [:index, :new, :create]
    resources :chicken, only: [:index, :new, :create]
  end

end
