class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index
  end

  def about
    @download = true
  end

  def downloads
    @download = true
  end

  def product
    get_products
    @product = params[:product] || 'pdf_converter'
    @product = @products.find(slug: @product)
  end

  private

  def get_products
    @products = Product.all
  end
end
