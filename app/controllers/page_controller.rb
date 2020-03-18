class PageController < ApplicationController
  def index
    @pages = Page.all
  end

  def show

    @page = Page.find(params[:id])

    # @browser = Browser.new(request.user_agent)
    # if @browser.device.mobile?
    #   feed = Skenzo.build.get_feed(@page.title, request.remote_ip, request.user_agent, request.original_url, request.referer, 1, 5, params, @gstats) 
    #   @ads = feed.Results.AdResultSet.Listing
    # end
  end
end
