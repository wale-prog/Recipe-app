class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order('created_at ASC')
    @user = current_user
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

  def update
    @recipe = Recipe.find(params[:id])
    render :show if @recipe.update(recipe_params)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
