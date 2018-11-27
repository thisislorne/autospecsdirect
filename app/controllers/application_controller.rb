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
    @os = params[:os] || 'mac'
    return unless %w(mac windows).include?(@os)
     @product = params[:product] || 'pdf_converter'
     @product = @products.find_by(slug: @product)
    @download_link = "#{@os}_download"
  end

  def mac_download
    send_file(
    "#{Rails.root}/public/Awoolo_Mac.zip",
    filename: "Awoolo_Mac.zip",
    type: "application/zip"
    )
  end

  def windows_download
    send_file(
    "#{Rails.root}/public/Awoolo_Windows.zip",
    filename: "Awoolo_Windows.zip",
    type: "application/zip"
    )
  end

  private

  def get_products
    @products = Product.all
    @office_solutions = @products.where("slug = 'word_processor' OR slug = 'pdf_converter' OR slug = 'zipfile_opener'")
    @media = @products.where("slug = 'media_player' OR slug = 'radio_app' OR slug = 'video_file_converter'")
  end
end
