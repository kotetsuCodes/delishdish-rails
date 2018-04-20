class DishinstructionsController < ApplicationController
  before_action :set_dish

  def index
    json_response(@dish.dishinstructions)
  end

  def show
    json_response(@dish.dishinstructions.find(params[:id]))
  end

  def create
    @instruction = Dishinstruction.create!(dishinstruction_params)
    @dish.dishinstructions << @instruction
  end

  def update
    @instruction = @dish.dishinstructions.find(params[:id])
    @instruction.update(dishinstruction_params)
    head :no_content
  end

  def destroy
    @dish.dishinstructions.delete(Dishinstruction.find(params[:id]))
    head :no_content
  end

  private 

  def dishinstruction_params
    params.permit(:dish_id, :id, :order, :instruction_content)
  end

  def set_dish
    @dish = Dish.find(params[:dish_id])
  end
end
