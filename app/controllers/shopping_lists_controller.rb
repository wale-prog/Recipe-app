class ShoppingListsController < ApplicationController
  def index
    @foods = Food.all
  end

  def total_price
    price = 0
    @foods.each do |recipe_food|
      price += Food.find(recipe_food.id).price
    end
    price
  end
  helper_method :total_price
end
