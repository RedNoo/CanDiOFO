class CuisinesController < ApplicationController

  before_action :set_cuisine, only:[:edit, :update, :show, :destroy]
  before_action :require_admincuisine, only:[:destroy]

  def index
    @cuisines = Cuisine.paginate(page: params[:page], per_page: 2)
  end


  def new
    @cuisine = Cuisine.new
  end

  def edit
  end

  def create
    #render plain: params[:cuisine].inspect
    @cuisine = Cuisine.new(cuisine_params)
    #@postcode = Postcodelatlng.find_by(postcode: @cuisine.post_code  )

    #@cuisine.lat = @postcode.latitude
    #@cuisine.lng = @postcode.longitude

    if @cuisine.save
      session[:cuisine_id] = @cuisine.id
      flash[:success] = "Welcome toda CanDiTicket"
      redirect_to cuisine_path(@cuisine)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @cuisine.destroy
    flash[:notice] = "Cuisine was successfully deleted."
    redirect_to cuisines_path
  end

def update
  if @cuisine.update(cuisine_params)
    flash[:notice] = "Cuisine was successfully updated."
    redirect_to cuisine_path(@cuisine)
  else
    render :edit
  end
end


  private
  def set_cuisine
      @cuisine = Cuisine.find(params[:id])
  end
  def cuisine_params
    params.require(:cuisine).permit(:user_id,:restaurant_id)
  end

  def require_admincuisine
    if !logged_in_cuisine? || !current_cuisine.admin?
      flash[:danger] = "You need admin permissions"
      redirect_to root_path
    end
  end
end
