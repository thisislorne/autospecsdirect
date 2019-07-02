class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def index

  end

  def search
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
    convtrack_query = CGI.escape(convtrack.to_query)

    redirect_to("https://results.searchbe.com/dynamiclander/?q=search&chnm=#{chnm}&chnm2=search&chnm3=#{chnm3}&convtrack=%26#{convtrack_query}&#{extra_params.to_query}") and return if params[:q].blank?

    search = Search.includes(:optimised_queries).find_by(slug: params[:q])

    optimised = search.optimised_queries.where(adgroup_id: params[:aid])
    defaults = search.optimised_queries.where(adgroup_id: 'default').where.not(query_id: optimised.pluck(:query_id))
    merged = optimised.or(defaults)


    if search.present?
      extra_params.delete :q

      if merged.count == 0
        optimised_query = _weighted_choice(search.queries)
      else
        optimised_query = _weighted_choice(merged)
        optimised_query = optimised_query.query
      end

      cpr = 0.0
      dcpr = 'd_15_0'
      cpr = (optimised_query.rpc * 15).round(2) unless optimised_query.rpc.nil?
      dcpr = "d_15_#{(optimised_query.rpc * 15).round(2)}" unless optimised_query.rpc.nil?
      
      convtrack[:properties_extra_value] = dcpr
      convtrack[:id] = "extid_#{params[:tracking_id]}" unless params[:tracking_id].nil?
      convtrack_query = CGI.escape(convtrack.to_query)  
            
      url = 'https://results.searchbe.com/dynamiclander/'
      
      redirect_to("#{url}?p=2&q=#{optimised_query.query}&chnm=#{chnm}&chnm2=#{optimised_query.query}&chnm3=#{chnm3}&cpr=#{cpr}&convtrack=%26#{convtrack_query}&#{extra_params.to_query}") and return
    else
      convtrack_query = CGI.escape(convtrack.to_query)  

      redirect_to("https://results.searchbe.com/dynamiclander/?q=#{params[:q]}&chnm=#{chnm}&chnm2=#{params[:q]}&chnm3=#{chnm3}&convtrack=%26#{convtrack_query}&#{extra_params.to_query}") and return
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
