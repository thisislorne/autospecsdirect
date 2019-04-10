class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def index

  end

  def search
    thumbnails = @ab.test('thumbnails',
      show: 1,
      hide: 1
    )

    compact_params = { kv_delimiter: '__', pair_delimiter: '___', special_characters: {'.' => '_dot_'}}
    chnm3 = @gstats.compact(['source', 'campaign_id', 'project_id', 'adgroup_id'], **compact_params, hour: true)

    redirect_to '/' unless params[:q].present?
    search = Search.includes(:queries).find_by(slug: params[:q])
    chnm = 'fb' if params[:utm_source] == 'facebook'
    chnm = 'gs' if params[:utm_source] == 'adwords'
    if search 
      query = _weighted_choice(search.queries)
      url = 'https://results.searchbe.com/dynamiclander/'
      p_val = 1
      p_val = 2 unless thumbnails == 'hide'

      extra_params = {
        utm_source: params[:utm_source],
        tracking_id: params[:tracking_id],
        aid: params[:aid],
        utm_campaign: params[:utm_campaign],
      }
      
      redirect_to "#{url}?p=#{p_val}&q=#{query.query}&chnm=#{chnm}&chnm2=#{query.query}&chnm3=#{chnm3}&#{extra_params.to_query}"
    else
      redirect_to "https://results.searchbe.com/dynamiclander/?q=#{params[:q]}"
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
