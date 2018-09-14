class ProductsController < ApplicationController
  def show
    @pagination_page = params[:page] || 1
    @page = 'product'
    @product = @products.find(params[:product] || 1)
    @reviews = @reviews.where(product: @product.id)
    @links = Link.where(product: @product.id)
  end
end
