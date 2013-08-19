class ProductsController < ApplicationController
  def create
    Product.create(product_params)
  end

  def index
    @products = Product.all

    render json: @products
  end

  def show
    @product = Product.find(params[:id])

    render json: @product
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :company_id, :product_type_id)
  end
end
