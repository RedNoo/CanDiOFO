class OrdersController < ApplicationController

before_action :set_order, only:[:edit, :update, :show, :destroy]
before_action :require_member, only:[:new, :create, :index, :edit, :show, :destroy, :update, :last_active_order ]

  def index
      @categories = Order.all #where(status: 1)
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @cart = Cart.where('status= 1 and member_id=? and id=?', current_member.id, order_params[:cart_id]).order('created_at DESC').take
    if(!@cart.nil?)
      respond_to do |format|
        format.json { render json: {'result': 'OK'}}
        #format.html { render nothing: true, notice: 'Update SUCCESSFUL!' }
      end
   else
     respond_to do |format|
       format.json { render json: {'result': 'NOK'}}
       #format.html { render nothing: true, notice: 'Update SUCCESSFUL!' }
     end

    end


  end

  def show
  end

  def destroy
    @order.destroy
    flash[:notice] = "Order was successfully deleted."
    redirect_to categories_path
  end

  def update
    if @order.update(order_params)
      flash[:notice] = "Order was successfully updated."
      redirect_to order_path(@order)
    else
      render :edit
    end
  end


  private
  def set_order
      @order = Order.find(params[:id])
  end
  def order_params
    params.require(:order).permit(:cart_id)
  end

end
