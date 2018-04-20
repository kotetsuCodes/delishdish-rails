class IngredientsController < ApplicationController
  before_action :set_dish

  def index
    json_response(@dish.ingredients)
  end

  def show
    @ingredient = @dish.ingredients.find(params[:id])

    json_response(@ingredient)
  end

  def create
    @ingredient = Ingredient.create!(ingredient_params)

    @dish.ingredients << @ingredient

    json_response(@ingredient, :created)
  end

  def destroy
    @dish.ingredients.find(params[:id]).delete

    head :no_content
  end

  def update
    @ingredient = @dish.ingredients.find(params[:id])

    @ingredient.update(ingredient_params)

    head :no_content
  end
  
  private

  def set_dish
    @dish = Dish.find(params[:dish_id])
  end

  def ingredient_params
    params.permit(:dish_id, :ingredient_id, :title, :quantity_name, :quantity_value)
  end

end
