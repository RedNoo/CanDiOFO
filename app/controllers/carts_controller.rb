class CartsController < ApplicationController

before_action :set_cart, only:[:edit, :update, :show, :destroy]
before_action :require_member, only:[:new, :create, :index, :edit, :show, :destroy, :update, :last_active_cart ]

  def index
      @categories = Cart.all #where(status: 1)
  end

  def new
    @cart = Cart.new
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      session[:cart_id] = @cart.id
      flash[:success] = "cart added your restaurant"
      redirect_to cart_path(@cart)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @cart.destroy
    flash[:notice] = "Cart was successfully deleted."
    redirect_to categories_path
  end

  def update
    if @cart.update(cart_params)
      flash[:notice] = "Cart was successfully updated."
      redirect_to cart_path(@cart)
    else
      render :edit
    end
  end

  def last_active_cart
    @cart = Cart.all.where(status: 1).where(status: 1 and :member_id current_member.id)order('created_at DESC').take
  end

  private
  def set_cart
      @cart = Cart.find(params[:id])
  end
  def cart_params
    params.require(:cart).permit(:user_id,:restaurant_id, :title, :line_no)
  end

end
