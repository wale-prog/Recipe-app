Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create] do 
    resources :recipes, only: [:new, :create, :index, :show, :destroy]
  end

  # Defines the root path route ("/")
  root to: "recipes#index"
end
