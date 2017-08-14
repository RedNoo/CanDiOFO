class CategoriesController << ApplicationController

before_action :set_category, only:[:edit, :update, :show, :destroy]

  def index
      @categories = Category.paginate(page: params[:page], per_page: 2)
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      session[:category_id] = @category.id
      flash[:success] = "category added your restaurant"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category was successfully deleted."
    redirect_to categories_path
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category was successfully updated."
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  private
  def set_category
      @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:user_id,:restaurant_id, :title, :line_no)
  end

end
