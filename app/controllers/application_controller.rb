require 'fully_hosted'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_products, :get_os
  def index
    @product = @products.find_by(slug: 'pdf_viewer')
    solutions 3
  end

  def about
    @download = true
  end

  def downloads
    @download = false
  end

  def product
    @os = params[:os] || 'mac'
    @product = @products.find_by(slug: params[:product])
    @local_url = download_url(@os, @product.slug)
    @features = Feature.where(product: @product)
    @follow_up = true
    solutions 4

    injection_params = {
  	  PRODUCT_TITLE: @product.title,
      DOWNLOAD_URL: @local_url,
      APP_NAME: @product.app_name,
      ROOT_IF_INSTALLED: '',
      MOUNT_PRODUCT: '1',
      PRODUCT_DESCRIPTION: @product.description,
      PRODUCT_VERSION: @product.version_number
    }

    options = {
      params: injection_params,
      user_agent: request.headers['User-Agent'],
      x_forwarded_for: request.headers['X-Forwarded-For'],
      #Fallback URL in case there is an error on link creation
      fallback_url: @local_url,
      #File name for the downloaded file
      downloadAs: "Awoolo_#{@os.capitalize}"
    }

    @dlm_url = if @os == 'mac'
                      options[:IC_USER_ID] = 10771
                      FullyHosted.get_link(options)
                    else
                      options[:IC_USER_ID] = 10772
                      FullyHosted.get_link(options)
                    end
    @download_link = @dlm_url
    @download_link = @local_url unless params[:gclid].present?
  end

  def download_software
    @product = @products.find_by(slug: params[:product])
    file_name = params[:os] == 'mac' ? @product.file_name_mac : @product.file_name_windows
    unless @product.nil?
      send_file(
      "#{Rails.root}/public/#{file_name}",
      filename: "#{file_name}",
      type: "application/zip"
      )
    end
  end

  private

  def get_products
    @products = Product.all
    @office_solutions = @products.where("slug = 'ultimate_converter' OR slug = 'pdf_viewer' OR slug = 'zip_file_opener'")
    @media = @products.where("slug = 'media_player' OR slug = 'radio_app' OR slug = 'video_converter'")
  end

  def get_os
    @os = OS.windows? ? 'windows' : 'mac'
  end

  def solutions number
    @solutions = @products.where("slug != '#{@product.slug}'")
    @solutions = @solutions.order("RANDOM()").limit(number)
  end
end
