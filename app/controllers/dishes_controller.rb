class DishesController < ApplicationController
  before_action :set_shoppinglist, only: :index
  
  def index
    json_response(@shoppinglist.dishes)
  end

  def create
    @dish = Dish.create!(dish_params)
    current_user.dishes << @dish

    json_response(@dish, :created)
  end

  private

  def dish_params
    params.permit(:title, :image_url, instructions_attributes: [:order, :instruction_content], ingredients_attributes: [:title, :quantity_name, :quantity_value])
  end

  def set_shoppinglist
    @shoppinglist = Shoppinglist.includes(:dishes).find(params[:shoppinglist_id])
  end

end
