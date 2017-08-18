class RestaurantsController < ApplicationController

  before_action :set_restaurant, only:[:edit, :update, :show, :destroy, :restaurant_cuisines, :new_cuisine, :add_cuisine, :new_category, :add_category,:upload_logo,:add_logo]
  before_action :require_adminrestaurant, only:[:destroy]
  before_action :require_user, only:[:new, :create, :index]

  def index
      @restaurants = current_user.restaurants.paginate(page: params[:page], per_page: 2)
  end

  def new
    @restaurant = Restaurant.new
    @cuisines = Cuisine.all
  end

  def edit
    #@restaurant = Restaurant.new
    @cuisines = Cuisine.all
  end

  def create
    #render plain: params[:restaurant].inspect
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    @postcode = Postcodelatlng.find_by(postcode: @restaurant.post_code  )

    @restaurant.lat = @postcode.latitude
    @restaurant.lng = @postcode.longitude

    #@cuisine = Cuisine.find(params[:cuisine_id])

    if @restaurant.save

      @restaurant_cuisine = RestaurantCuisine.new
      @restaurant_cuisine.user_id = current_user.id
      @restaurant_cuisine.cuisine_id = params[:cuisine_id]
      @restaurant_cuisine.restaurant_id = @restaurant.id
      @restaurant_cuisine.save

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
      flash[:success] = "Restaurant was successfully updated."
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def restaurant_cuisines
    @cuisines = @restaurant.cuisines.paginate(page: params[:page], per_page: 2)
  end

  def new_cuisine
    @cuisines = Cuisine.all
    @restaurant_cuisine = RestaurantCuisine.new
  end

  def add_cuisine
    @restaurant_cuisine = RestaurantCuisine.new(restaurant_cuisine_params)
    @restaurant_cuisine.user_id = current_user.id

    if @restaurant_cuisine.save
      flash[:success] = "Cuisine added to restaurant"
      redirect_to restaurant_path(@restaurant)
    else
      render :new_cuisine
    end

  end

  def new_category
    @category = Category.new
  end

  def add_category
    @restaurant_category = Category.new(restaurant_category_params)
  #  @restaurant_category.user_id = current_user.id

    if @restaurant_category.save
      flash[:success] = "category added to restaurant"
      redirect_to restaurant_path(@restaurant)
    else
      render :new_category
    end

  end

  def recently_added
    @restaurants = Restaurant.order('created_at DESC').all.paginate(page: params[:page], per_page: 12)
  end

  def area_restaurant
    @area_code_original = params[:id]
    @area_code =   @area_code_original.clone
    @area_code.insert(-4," ")
    @page_param = params[:page]
    @restaurants = Restaurant.where(post_code: @area_code).order('created_at DESC').all.paginate(page: params[:page], per_page: 12)
  end

  def get_product_by_category
    @category_id = params[:id]
    @products = Product.where(category_id:  params[:id])
  end

  def new_product
    @category = Category.find(params[:id])
    @restaurant = @category.restaurant
    @product = Product.new
  end

  def add_product
    @product = Product.new(restaurant_product_params)
  #  @restaurant_category.user_id = current_user.id

    if @product.save
      flash[:success] = "category added to restaurant"
      redirect_to new_product_path(@product.category_id)
    else
      render :new_product
    end
  end

  def upload_logo

  end

  def add_logo
    if @restaurant.update(logo_params)


      flash[:success] = "Logo added the restaurant."

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
    params.require(:restaurant).permit(:name,:address,:open_time,:open_time_minute,:close_time,:close_time_minute, :post_code, :cuisine_id)
  end

  def restaurant_cuisine_params
    params.require(:restaurant_cuisine).permit( :cuisine_id, :restaurant_id)
  end

  def restaurant_category_params
    params.require(:category).permit(  :restaurant_id, :title, :line_no)
  end

  def restaurant_product_params
    params.require(:product).permit( :category_id ,:restaurant_id, :title, :line_no, :description, :price)
  end

  def logo_params
    params.require(:restaurant).permit( :logo)
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
