class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :products
  def index
    @page = 'index'
  end

  def about
    @page = 'about'
    @message = Message.new
  end

  private

  def products
    @products = Product.all
  end
end
