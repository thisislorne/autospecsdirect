class LpController < ApplicationController
  def show
    @product = @products.find_by(slug: params[:product])
    
  end
end
