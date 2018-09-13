class ProductsController < ApplicationController
  def show
    @pagination_page = params[:page] || 1
    @page = 'product'
    @product = Product.first
    @reviews = Review.where(product: @product.id)
    @reviews = @reviews.paginate(page: @pagination_page, per_page: 4)
    @links = Link.where(product: @product.id)
  end
end
