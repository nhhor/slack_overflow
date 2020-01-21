class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do
    flash[:alert] = 'The record you tried to access no longer exists.'
    render :sorry   # or e.g. redirect_to :action => :index
  end

  def index
    @questions = Question.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully created!"
      redirect_to products_path
    else
      flash[:alert] = "There was a problem creating this product!"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product= Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to products_path
    else
      flash[:alert] = "There was a problem updating this product!"
      render :edit
    end
  end

  def destroy
    flash[:notice] = "Product successfully removed!"

    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end

end
