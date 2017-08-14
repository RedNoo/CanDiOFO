class RestaurantRestaurantCuisinesController < ApplicationController

  before_action :set_restaurant_cuisine, only:[:edit, :update, :show, :destroy]
  before_action :require_adminrestaurant_cuisine, only:[:destroy]

  def index
    @restaurant_cuisines = RestaurantCuisine.paginate(page: params[:page], per_page: 2)
  end


  def new
    @restaurant_cuisine = RestaurantCuisine.new
  end

  def edit
  end

  def create
    @restaurant_cuisine = RestaurantCuisine.new(restaurant_cuisine_params)

    if @restaurant_cuisine.save
      session[:restaurant_cuisine_id] = @restaurant_cuisine.id
      flash[:success] = "Welcome toda CanDiTicket"
      redirect_to restaurant_cuisine_path(@restaurant_cuisine)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @restaurant_cuisine.destroy
    flash[:notice] = "RestaurantCuisine was successfully deleted."
    redirect_to restaurant_cuisines_path
  end

def update
  if @restaurant_cuisine.update(restaurant_cuisine_params)
    flash[:notice] = "RestaurantCuisine was successfully updated."
    redirect_to restaurant_cuisine_path(@restaurant_cuisine)
  else
    render :edit
  end
end


  private
  def set_restaurant_cuisine
      @restaurant_cuisine = RestaurantCuisine.find(params[:id])
  end
  def restaurant_cuisine_params
    params.require(:restaurant_cuisine).permit(:user_id,:restaurant_id)
  end

  def require_adminrestaurant_cuisine
    if !logged_in_restaurant_cuisine? || !current_restaurant_cuisine.admin?
      flash[:danger] = "You need admin permissions"
      redirect_to root_path
    end
  end
end
