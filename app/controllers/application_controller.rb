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

  end
end
