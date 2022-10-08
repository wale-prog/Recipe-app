class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]

  def index
    @recipes = Recipe.accessible_by(current_ability).order('created_at DESC')
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = Food.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to user_recipes_path(current_user)
      flash[:notice] = 'Recipe creates successfully'
    else
      render :new
      flash[:notice] = 'Recipe was not created'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to user_recipes_path(current_user)
      flash[:notice] = 'Recipe removed successfully'
    else
      flash[:notice] = 'Recipe was not removed'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
