class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.order('created_at ASC').where(public: true)
    @user = current_user
  end
end
