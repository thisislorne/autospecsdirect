require 'fully_hosted'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_products, :get_os
  def index
    @product = @products.find_by(slug: 'awoolo_pdf')
    solutions
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
    @features = Feature.where(product: @product)
    @follow_up = true
    solutions
    if @product.mac
      @local_url_mac = @product.file_name_mac
      @dlm_mac = dlm_url(@product.title, @local_url_mac, @product.app_name, @product.description, @product.version_number, @product.app_name, 10771)
      @download_link_mac = @dlm_mac
      @download_link_mac = @local_url_mac unless params[:glcid].present?
    end
    if @product.windows
      @local_url_windows = @product.file_name_windows
      @dlm_windows = dlm_url(@product.title, @local_url_windows, @product.app_name, @product.description, @product.version_number, @product.app_name, 10772)
      @download_link_windows = @dlm_windows
      @download_link_windows = @local_url_windows unless params[:glcid].present?
    end
  end

  # def download_software
  #   @product = @products.find_by(slug: params[:product])
  #   file_name = params[:os] == 'mac' ? @product.file_name_mac : @product.file_name_windows
  #   unless @product.nil?
  #     send_file(
  #     "#{Rails.root}/public/#{file_name}",
  #     filename: "#{file_name}",
  #     type: "application/zip"
  #     )
  #   end
  # end

  private

  def dlm_url(title, url, app_name, description, version_number, download_as, ic_user_id)
    injection_params = {
  	  PRODUCT_TITLE: title,
      DOWNLOAD_URL: url,
      APP_NAME: app_name,
      ROOT_IF_INSTALLED: '',
      MOUNT_PRODUCT: '1',
      PRODUCT_DESCRIPTION: description,
      PRODUCT_VERSION: version_number
    }

    options = {
      params: injection_params,
      user_agent: request.headers['User-Agent'],
      x_forwarded_for: request.headers['X-Forwarded-For'],
      #Fallback URL in case there is an error on link creation
      fallback_url: url,
      #File name for the downloaded file
      downloadAs: download_as,
      IC_USER_ID: ic_user_id
    }
  end

  def get_products
    @products = Product.all
    @office_solutions = @products.where("slug = 'awoolo_ultimate' OR slug = 'awoolo_pdf' OR slug = 'awoolo_unzip' OR slug = 'awoolo_file'")
    @media = @products.where("slug = 'awoolo_media' OR slug = 'awoolo_radio' OR slug = 'awoolo_converter'")
  end

  def get_os
    @os = OS.windows? ? 'windows' : 'mac'
  end

  def solutions
    @solutions = @products.where("slug != '#{@product.slug}'")
    @solutions = @solutions.order("RANDOM()").limit(4)
  end
end
