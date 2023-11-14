class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :create, :edit, :update, :destroy]

  # as a user I want to see all my reestaurants
  def index
    @restaurants = Restaurant.all
  end

  # as a user I want to see a restaurant with an id
  def show
  end

  # as a user i want to add a new restaurant
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  # as a user I want to edit a restaurant
  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  #as a user I want to delete a restaurant
  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
