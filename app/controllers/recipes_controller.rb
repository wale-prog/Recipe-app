class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @user = User.find(1)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to user_recipes_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to user_recipes_path(current_user)
    else
      render :index
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
  end
end
