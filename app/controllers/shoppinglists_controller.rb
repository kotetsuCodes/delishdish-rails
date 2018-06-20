class ShoppinglistsController < ApplicationController
  before_action :set_shoppinglist, only: [:show, :update, :destroy]

  # GET /shoppinglists
  def index
    @shoppinglists = current_user.shoppinglists    
    json_response(@shoppinglists)
  end

  # POST /shoppinglists
  def create

    @shoppinglist = Shoppinglist.create!(shoppinglist_params)
    current_user.shoppinglists << @shoppinglist

    json_response(@shoppinglist, :created)
  end

  # GET /shoppinglist/:id
  def show 
    json_response(@shoppinglist)
  end

  # PUT /shoppinglists/:id
  def update
    @shoppinglist.update(shoppinglist_params)
    head :no_content
  end

  # DELETE /shoppinglists/:id
  def destroy
    @shoppinglist.destroy
    head :no_content
  end

  private

  def shoppinglist_params
    params.permit(:title, dish_ids: [])
  end

  def set_shoppinglist
    @shoppinglist = Shoppinglist.find(params[:id])
  end
end
