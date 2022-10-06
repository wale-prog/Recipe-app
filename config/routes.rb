Rails.application.routes.draw do
  # resources :shopping_lists
  # resources :foods
  devise_for :users

  resources :users, only: %i[index show ] do
    resources :foods, only: %i[index new create show destroy]
    resources :recipes, only: %i[index new create show destroy update]
    resources :public_recipes
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "recipes#index"
end
