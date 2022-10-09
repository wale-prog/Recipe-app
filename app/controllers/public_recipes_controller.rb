class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.order('created_at DESC').where(public: true).includes(:user)
    @user = current_user
  end

  def show
    @recipe = Recipe.order('created_at DESC').where(public: true).find(params[:id])
    @foods = Food.all
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to user_public_recipes_path(current_user)
    else
      render :index
    end
  end
end
