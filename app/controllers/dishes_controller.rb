class DishesController < ApplicationController
  before_filter :authenticate_user!
  def create
    @dish = Dish.create!(dish_params)
    json_response(@dish, :created)
  end

  private

  def dish_params
    params.permit(:title)
  end

end
