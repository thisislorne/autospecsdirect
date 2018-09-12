class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :products
  def index

  end

  def about

  end

  private

  def products
    @products = Product.all
  end
end
