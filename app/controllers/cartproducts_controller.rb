class CartproductsController < ApplicationController
  before_action :set_cartproduct, only: %i[edit update  destroy]
  before_action :require_member, only: %i[new create index edit show destroy update last_active_cartproduct]

  def index
    @cartproducts = Cartproduct.where('cart_id = ?', params[:id])
  end

  def show
    @cartproducts = Cartproduct.where('cart_id = ?', params[:id])
   render :layout => false
  end

  def new
    @cartproduct = Cartproduct.new
  end

  def edit; end

  def create
    @cart = Cart.where('status= 1 and member_id= ?', current_member.id).order('created_at DESC').take

    if @cart.nil?
      @cart = Cart.new(cartproduct_params)
      @cart.status = 1
      @cart.member_id = current_member.id
      @cart.save
    end

    @cartproduct = Cartproduct.where('cart_id = ? and product_id = ?', @cart.id, cartproduct_params[:product_id]).take

    if @cartproduct.nil?
      @cartproduct = Cartproduct.new(cartproduct_params)
      @cartproduct.cart_id = @cart.id
      @cartproduct.productcount = 1

      if @cartproduct.save
        # session[:cartproduct_id] = @cartproduct.id
        # flash[:success] = "your item added to your cart"
        # redirect_to cartproduct_path(@cartproduct)
        respond_to do |format|
          format.json { render json: {'id': @cart.id}}
          format.html { render nothing: true, notice: 'Update SUCCESSFUL!' }
        end
      end

    else
      @cartproduct.productcount += 1
      if @cartproduct.update(cartproduct_params)
        respond_to do |format|
          format.json { render json: {'id': @cart.id} }
          format.html { render nothing: true, notice: 'Update SUCCESSFUL!' }
        end
     end
   end
  end

  def destroy
    @cartproduct.destroy
    respond_to do |format|
      format.json { render json: {'id': @cartproduct.cart.id} }
      format.html { render nothing: true, notice: 'Destroy SUCCESSFUL!' }
    end
  end

  def update
    if @cartproduct.update(cartproduct_params)
      flash[:notice] = 'Cartproduct was successfully updated.'
      redirect_to cartproduct_path(@cartproduct)
    else
      render :edit
    end
  end

  def last_active_cartproduct
    @cart = Cart.where('status= 1 and member_id= ?', current_member.id).order('created_at DESC').take
  end

  private

  def set_cartproduct
    @cartproduct = Cartproduct.find(params[:id])
  end

  def cartproduct_params
    params.require(:cartproduct).permit(:restaurant_id, :product_id)
  end
end
