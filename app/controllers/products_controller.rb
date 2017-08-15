class ProductsController < ApplicationController

  before_action :set_product, only:[:edit, :update, :show, :destroy]

    def index
        @categories = Product.paginate(page: params[:page], per_page: 2)
    end

    def new
      @product = Product.new
    end

    def edit
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        session[:product_id] = @product.id
        flash[:success] = "product added your restaurant"
        redirect_to product_path(@product)
      else
        render :new
      end
    end

    def show
    end

    def destroy
      @product.destroy
      flash[:notice] = "Product was successfully deleted."
      redirect_to categories_path
    end

    def update
      if @product.update(product_params)
        flash[:notice] = "Product was successfully updated."
        redirect_to product_path(@product)
      else
        render :edit
      end
    end

    

    private
    def set_product
        @product = Product.find(params[:id])
    end
    def product_params
      params.require(:product).permit(:user_id,:restaurant_id, :category_id, :title, :line_no)
    end
end
