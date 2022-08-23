class FoodsController < ApplicationController
  
  def index; end
  
  def show
    @restaurant = current_user.restaurants.find(params[:id])
  end

end
