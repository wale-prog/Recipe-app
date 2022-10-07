class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.order('created_at ASC').where(public: true)
    @user = current_user
  end

  def show
    @recipe = Recipe.find(params[:id])
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
