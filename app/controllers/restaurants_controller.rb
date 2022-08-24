class RestaurantsController < ApplicationController
  before_action :require_restaurant, only: [:update, :destroy]

  def index
    @restaurants = current_user.restaurants.all
  end

  def new
    @restaurant = Restaurant.new
  end
    
  def create
    @restaurant = current_user.restaurants.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      flash[:register_errors] = @restaurant.errors.full_messages
      redirect_to new_restaurant_path
    end
  end
    
  def edit
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path
    else
      render :edit
    end
  end
  
  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

  def require_restaurant
    @restaurant = current_user.restaurants.find(params[:id])
  end

end

