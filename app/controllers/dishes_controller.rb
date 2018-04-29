class DishesController < ApplicationController
  before_action :authenticate_request!
  
  def index
    json_response(current_user.dishes)
  end

  def create
    @dish = Dish.create!(dish_params)
    current_user.dishes << @dish

    json_response(@dish, :created)
  end

  private

  def dish_params
    params.permit(:title)
  end

end
