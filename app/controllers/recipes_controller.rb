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
		@user = User.find(params[:user_id])
		@recipe = @user.recipes.new(recipe_params)
		if @recipe.save
			redirect_to user_recipes_path(@user.id)
		else
			render :new
		end
	end
	
	def destroy
		@recipe = Recipe.find(params[:id])
		if @recipe.destroy
			redirect_to user_recipes_path(@user)
		else
			render :index
		end
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
	end

end