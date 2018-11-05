class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_products
  def index
    @product = @products.find_by(slug: 'pdf_converter')
    @solutions = @products.where("slug = 'word_processor' OR slug = 'media_player' OR slug = 'video_file_converter'")
  end

  def about
    @download = true
  end

  def downloads
    @download = true
  end

  def product
    @product = params[:product] || 'pdf_converter'
    @product = @products.find_by(slug: @product)
  end

  private

  def get_products
    @products = Product.all
    @office_solutions = @products.where("slug = 'word_processor' OR slug = 'pdf_converter' OR slug = 'zipfile_converter'")
    @media = @products.where("slug = 'media_player' OR slug = 'radio_app' OR slug = 'video_file_converter'")
  end
end
