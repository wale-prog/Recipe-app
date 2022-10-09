Rails.application.routes.draw do
  # resources :shopping_lists
  # resources :foods
  devise_for :users

  resources :users do
    resources :foods
    resources :recipes, only: %i[index new create show destroy]
    resources :public_recipes
  end

  resources :public_recipes, only: %i[index]
  resources :shopping_lists, only: %i[index]
  resources :recipe_foods, only: %i[new create destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "recipes#index"
end
