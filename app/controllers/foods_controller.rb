class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to user_foods_path(current_user)
      flash[:success] = 'Food saved successfully'
    else
      render :new
      flash.now[:error] = 'Food not saved'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      redirect_to user_foods_path(current_user)
      flash[:success] = 'Food deleted successfully'
    else
      flash.now[:error] = 'Food not deleted'
      render :index
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
