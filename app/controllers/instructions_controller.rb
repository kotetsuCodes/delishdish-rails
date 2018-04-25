class InstructionsController < ApplicationController
  before_filter :authenticate_user!  
  before_action :set_dish
  
    def index
      json_response(@dish.instructions)
    end
  
    def show
      json_response(@dish.instructions.find(params[:id]))
    end
  
    def create
      @instruction = Instruction.create!(instruction_params)
      @dish.instructions << @instruction
    end
  
    def update
      @instruction = @dish.instructions.find(params[:id])
      @instruction.update(instruction_params)
      head :no_content
    end
  
    def destroy
      @dish.instructions.find(params[:id]).delete
      head :no_content
    end
  
    private 
  
    def instruction_params
      params.permit(:dish_id, :id, :order, :instruction_content)
    end
  
    def set_dish
      @dish = Dish.find(params[:dish_id])
    end
  end
  

