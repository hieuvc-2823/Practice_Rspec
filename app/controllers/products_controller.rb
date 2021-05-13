class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
    return if @product

    flash[:warning] = "Product is not found!"
    redirect_to root_path
  end
end
