class IngredientsController < ApplicationController

  def index
    @dish = Dish.find(params[:dish_id])
    json_response(@dish.ingredients)
  end

  def show
    @dish = Dish.find(params[:dish_id])
    @ingredient = @dish.ingredients.find(params[:id])

    json_response(@ingredient)
  end

  def create
    @dish = Dish.find(params[:dish_id])
    @ingredient = Ingredient.create!(ingredient_params)

    @dish.ingredients << @ingredient

    json_response(@ingredient, :created)
  end

  def destroy
    @dish = Dish.find(params[:dish_id])
    @dish.ingredients.delete(Ingredient.find(params[:id]))

    head :no_content
  end

  def update
    @dish = Dish.find(params[:dish_id])
    @ingredient = @dish.ingredients.find(params[:id])

    @ingredient.update(ingredient_params)

    head :no_content
  end
  
  private

  def ingredient_params
    params.permit(:dish_id, :ingredient_id, :title, :quantity_name, :quantity_value)
  end

end
