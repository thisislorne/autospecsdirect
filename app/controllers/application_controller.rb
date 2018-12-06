require 'fully_hosted'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_products, :get_os, :set_source
  def index
    @product = @products.find_by(slug: 'awoolo_pdf')
    get_download_files
    solutions
  end

  def about
    @download = true
  end

  def downloads
    @download = false
  end

  def product
    get_product_and_features
    @follow_up = true
    solutions
    get_download_files
  end

  def lp
    get_product_and_features
    get_download_files
    @step_one_text = @ab.test('step_one_text',
      start: 1,
      download: 1
    )
  end

  private

  def get_product_and_features
    @product = @products.find_by(slug: params[:product])
    @features = Feature.where(product: @product)
  end

  def get_download_files
    if @product.mac
      @local_url_mac = @product.file_name_mac
      @dlm_mac = dlm_url(@product.title, @local_url_mac, @product.app_name, get_file_name(@local_url_mac), @product.file_size, @product.description, @product.version_number, @product.app_name, 10771)
      @download_link_mac = @dlm_mac
      @download_link_mac = @local_url_mac unless session[:dlm].present?
    end
    if @product.windows
      @local_url_windows = @product.file_name_windows
      @dlm_windows = dlm_url(@product.title, @local_url_windows, @product.app_name, get_file_name(@local_url_mac), @product.file_size, @product.description, @product.version_number, @product.app_name, 10772)
      @download_link_windows = @dlm_windows
      @download_link_windows = @local_url_windows unless session[:dlm].present?
    end
    @download_type = session[:dlm].present? ? 'offer' : 'software'
  end

  def dlm_url(title, url, app_name, file_name, file_size, description, version_number, download_as, ic_user_id)
    injection_params = {
  	  PRODUCT_TITLE: title,
      DOWNLOAD_URL: url,
      APP_NAME: app_name,
      ROOT_IF_INSTALLED: '',
      MOUNT_PRODUCT: '1',
      PRODUCT_FILE_NAME: file_name,
      PRODUCT_FILE_SIZE: file_size,
      PRODUCT_DESCRIPTION: description,
      PRODUCT_VERSION: version_number,
      CHNL: @gstats.session_id,
      PRODUCT_PUBLIC_DATE: '01/12/2018'
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
    FullyHosted.get_link(options)
  end

  def get_products
    @products = Product.all
    @office_solutions = @products.where("slug = 'awoolo_ultimate' OR slug = 'awoolo_pdf' OR slug = 'awoolo_unzip' OR slug = 'awoolo_file'")
    @media = @products.where("slug = 'awoolo_media' OR slug = 'awoolo_radio' OR slug = 'awoolo_converter'")
  end

  def get_os
    @browser = Browser.new(request.user_agent)
    @os = @browser.platform.windows? ? 'windows' : 'mac'
    @os = params[:os] if params[:os].present? && %w[windows mac].include?(params[:os])
  end

  def solutions
    @solutions = @products.where("slug != '#{@product.slug}'")
    @solutions = @solutions.order("RANDOM()").limit(4)
  end

  def set_source
    if params[:gclid].present?
      session[:dlm] = true
    end
  end

  # returns the file name from the given url
  def get_file_name(url)
    url_object = URI.parse(url)
    url_path = url_object.path
    url_path.split("/").last
  end

end
