class ShoppinglistsController < ApplicationController
  before_action :set_shoppinglist, only: [:show, :update, :destroy]

  # GET /shoppinglists
  def index
    @shoppinglists = Shoppinglist.all
    json_response(@shoppinglists)
  end

  # POST /shoppinglists
  def create
    @shoppinglist = Shoppinglist.create!(shoppinglist_params)
    json_response(@shoppinglist, :created)
  end

  # GET /shoppinglist/:id
  def show 
    json_response(@shoppinglist)
  end

  # PUT /shoppinglists/:id
  def update
    @shoppinglist.update(shoppinglist_params)
    @dish = Dish.find(params[:dish_id])

    @shoppinglist.dishes << @dish
    head :no_content
  end

  # DELETE /shoppinglists/:id
  def destroy
    @shoppinglist.destroy
    head :no_content
  end

  private

  def shoppinglist_params
    params.permit(:title)
  end

  def set_shoppinglist
    @shoppinglist = Shoppinglist.find(params[:id])
  end
end
