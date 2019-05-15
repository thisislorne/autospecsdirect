class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def index

  end

  def search
    thumbnails = @ab.test('thumbnails',
      show: 1,
      hide: 1
    )

    extra_params = params
    extra_params.delete :controller
    extra_params.delete :action

    compact_params = { kv_delimiter: '__', pair_delimiter: '___', special_characters: {'.' => '_dot_'}}
    chnm3 = @gstats.compact(['source', 'campaign_id', 'project_id', 'adgroup_id'], **compact_params, hour: true)
    chnm = 'fb' if params[:utm_source] == 'facebook'
    chnm = 'gs' if params[:utm_source] == 'adwords'
    chnm = 'gdn' if params[:utm_source] == 'gdn'
    chnm = 'bing' if params[:utm_source] == 'bing'

    convtrack = {}
    convtrack[:properties_extra_value] = '0'
    convtrack[:id] = 'extid_1'

    redirect_to("https://results.searchbe.com/dynamiclander/?q=search&chnm=#{chnm}&chnm2=search&chnm3=#{chnm3}&convtrack=%26#{convtrack}&#{extra_params.to_query}") and return if params[:q].blank?

    search = Search.includes(:queries).find_by(slug: params[:q])
    
    
    if search.present? && params[:aid].in?(search.optimised_queries.pluck(:adgroup_id))
      extra_params.delete :q
      optimised_query = _weighted_choice(search.optimised_queries.where(adgroup_id: params[:aid]))
      
      convtrack[:properties_extra_value] = "d_15_#{(optimised_query.rpc * 15).round(2)}" unless optimised_query.rpc.nil?
      convtrack[:id] = "extid_#{params[:tracking_id]}" unless params[:tracking_id].nil?
      convtrack_query = CGI.escape(convtrack.to_query)  
      
      url = 'https://results.searchbe.com/dynamiclander/'
      p_val = 1
      p_val = 2 unless thumbnails == 'hide'
      
      redirect_to("#{url}?p=#{p_val}&q=#{optimised_query.query.query}&chnm=#{chnm}&chnm2=#{optimised_query.query.query}&chnm3=#{chnm3}&cpr=#{cpr}&convtrack=%26#{convtrack_query}&#{extra_params.to_query}") and return unless optimised_query.rpc.nil?
  

    elsif search.present?
      extra_params.delete :q
      ave = 0.0
      query = _weighted_choice(search.queries)
      rpcs = query.optimised_queries.where("rpc > 0")
      ave = (rpcs.sum(:rpc) / rpcs.count) unless rpcs.empty?
      ave = (ave*15).round(2)
      
      convtrack[:properties_extra_value] = "d_15_#{ave}" unless ave.nil?
      convtrack[:id] = "extid_#{params[:tracking_id]}" unless params[:tracking_id].nil?
      convtrack_query = CGI.escape(convtrack.to_query)
      
      
      url = 'https://results.searchbe.com/dynamiclander/'
      p_val = 1
      p_val = 2 unless thumbnails == 'hide'

      
      redirect_to("#{url}?p=#{p_val}&q=#{query.query}&chnm=#{chnm}&chnm2=#{query.query}&chnm3=#{chnm3}&cpr=#{ave}&convtrack=%26#{convtrack_query}&#{extra_params.to_query}") and return
    else
      convtrack_query = CGI.escape(convtrack.to_query)  

      redirect_to("https://results.searchbe.com/dynamiclander/?q=#{params[:q]}&chnm=#{chnm}&chnm2=#{params[:q]}&chnm3=#{chnm3}&convtrack=%26#{convtrack_query}&#{extra_params.to_query}") and return

    end
    
  end

  def r
    compact_params = { kv_delimiter: '__', pair_delimiter: '___', special_characters: {'.' => '_dot_'}}
    @chnm3 = @gstats.compact(['source', 'campaign_id', 'project_id', 'adgroup_id'], **compact_params, hour: true)

    @lp = "r_1"
    @arrows = @ab.test('arrows',
      true: 1,
      false: 1
    )

    redirect_to '/' unless params[:q].present?
    search = Search.includes(:queries).find_by(slug: params[:q])
    if search 
      @queries = search.queries.order(:weighting).limit(7)
      @url = 'https://results.searchbe.com/dynamiclander/'

    else
      # redirect_to "https://results.searchbe.com/dynamiclander/?q=#{params[:q]}"
    end
  end

  private

  def _weighted_choice(keywords)
    total = keywords.sum(:weighting)
    random = rand(1..100) / 100.0 * total
    keywords.each do |keyword|
      random -= keyword.weighting
      return keyword if random <= 0
    end
  end

end
