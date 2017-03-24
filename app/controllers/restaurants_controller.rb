class RestaurantsController < ApplicationController

  before_action :set_restaurant, only:[:edit, :update, :show, :destroy]
  before_action :require_adminrestaurant, only:[:destroy]
  before_action :require_user, only:[:new, :create]



  def index
    @restaurants = Restaurant.paginate(page: params[:page], per_page: 2)
  end


  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    #render plain: params[:restaurant].inspect
    @restaurant = Restaurant.new(restaurant_params)
    @postcode = Postcodelatlng.find_by(postcode: @restaurant.post_code  )

    @restaurant.lat = @postcode.latitude
    @restaurant.lng = @postcode.longitude

    if @restaurant.save
      session[:restaurant_id] = @restaurant.id
      flash[:success] = "Welcome toda CanDiTicket"
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @restaurant.destroy
    flash[:notice] = "Restaurant was successfully deleted."
    redirect_to restaurants_path
  end

def update
  if @restaurant.update(restaurant_params)
    flash[:notice] = "Restaurant was successfully updated."
    redirect_to restaurant_path(@restaurant)
  else
    render :edit
  end
end


  private
  def set_restaurant
      @restaurant = Restaurant.find(params[:id])
  end
  def restaurant_params
    params.require(:restaurant).permit(:email,:password, :full_name, :post_code)
  end

  def require_adminrestaurant
    if !logged_in_restaurant? || !current_restaurant.admin?
      flash[:danger] = "You need admin permissions"
      redirect_to root_path
    end
  end

  def require_user
    if !logged_in_user?
      flash[:danger] = "You need to log in"
      redirect_to root_path
    end
  end
end
