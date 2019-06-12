require './config/environment'
class Genius < Thor

  desc 'optimise_keywords', 'A task to fetch RPCs from gstats, and then optimise queries.'
  def optimise_keywords
    require 'rest-client'
    logger = Logger.new(STDOUT)
    logger.level = Logger::INFO
    Rails.logger = logger

    started = Time.now
    logger.info "[IMPORTER] Started - #{started}"

    site = 'searchbe.com'


    # get all the searches first
    # then match against adgroup RPCs
    keywords = []

    token = _get_token(logger)
    adgroups = _get_adgroup_ids(logger, token, site)
    adgroups.each do |adgroup|
      begin
        ks = _get_keyword_rpc(logger, token, site, adgroup['adgroup_id'])
        ks.each do |k|
          keywords.push(k)
        end
      rescue => ex
        logger.info ex
      end
    end
    
    Search.where(optimisation_enabled: true).each do |search|
      search.adgroup_ids = []
      search.queries.each do |query|
        next unless query.enabled
        matched_kws = keywords.select {|k| k['keyword_id'].downcase == query.query_stripped}
        matched_kws.each do |mkw|
          query.search.adgroup_ids.push(mkw['adgroup_id'])
          query.search.save!
          logger.info "[IMPORTER] matched_kws - #{query.query} #{mkw['adgroup_id']}"
        end
      end
      search.adgroup_ids = search.adgroup_ids.uniq
      search.save!
      search.queries.each do |query|
        search.adgroup_ids.each do |adgroup_id|
          oq = query.optimised_queries.find_or_create_by(adgroup_id: adgroup_id, weighting: query.weighting)
          oq.save!
          logger.info "[IMPORTER] updated default query - #{oq.query.query} #{adgroup_id}"
        end
      end
    end
    

    @query_alerts = []
    @queries_to_optimise = []

    kw_array = []
    keywords.each do |keyword|
      kw_array.push(keyword['keyword_id'].downcase)
    end

    adgroups.each do |adgroup|

    # adgroups[1..2].each do |adgroup|
      begin
        s = Search.where("? = ANY(adgroup_ids)", adgroup['adgroup_id']).first
        next unless s.present?
        queries = s.queries
        next unless queries.present?

        queries.each do |query|
          next unless query.enabled
          
          keyword = keywords.detect {|k| k['keyword_id'].downcase == query.query_stripped}
          logger.info "[IMPORTER] Clicks for #{query.query} #{keyword['clicks_sum']}"

          if keyword['clicks_sum'] > 10
            obj = { 
              query_id: query.id, 
              revenue_per_impression: keyword['revenue_per_impression'], 
              rpc: keyword['revenue_per_click'],
              clicks: keyword['clicks_sum'],
              impressions: keyword['impressions_sum'],
              adgroup_id: adgroup['adgroup_id']
            }
            @queries_to_optimise.push obj
          end
        end

        logger.info "[IMPORTER] adgroup_id #{adgroup['adgroup_id']} done"
      rescue Exception => e
        logger.info "[IMPORTER] failed on #{adgroup['adgroup_id']}"
        logger.info "#{e}"
      end    
    end

    _optimise_queries(@queries_to_optimise, logger)

    # _slack_notify(@query_alerts, @queries_to_optimise)      
    
    logger.info "[IMPORTER] done done"
  end

  private

  def _optimise_queries(queries_to_optimise, logger)
    queries_to_optimise.each do |qto|
      next if qto[:adgroup_id].nil?
      if qto[:weighting_default].present?
        oq = OptimisedQuery.find_or_create_by(query_id: qto[:query_id], adgroup_id: qto[:adgroup_id])
        oq.weighting = qto[:weighting_default]
        oq.rpc = qto[:rpc]
        oq.clicks = qto[:clicks]
        oq.impressions = qto[:impressions]
        oq.rpi = qto[:revenue_per_impression]
        oq.save!

        logger.info "[IMPORTER] oq updated #{oq.id} with weighting_default for #{oq.query.query}"
        
      elsif qto[:revenue_per_impression].present?
        rpi = qto[:revenue_per_impression]
        # rev per imp +1 to the power of 10, -1. 
        optimised_weighting = ((rpi + 1) ** 10 -1) * 10
        oq = OptimisedQuery.find_or_create_by(query_id: qto[:query_id], adgroup_id: qto[:adgroup_id])
        oq.weighting = optimised_weighting
        oq.rpc = qto[:rpc]
        oq.clicks = qto[:clicks]
        oq.impressions = qto[:impressions]
        oq.rpi = rpi
        oq.save!

        logger.info "[IMPORTER] oq updated #{oq.id} with optimised_weighting for #{oq.query.query}"
      end
    end  
  end

  def _slack_notify(query_alerts, queries_to_optimise)
    client = Slack::Web::Client.new
    msg = "Optimiser has run.\nOptimised weights of #{queries_to_optimise.count - @query_alerts.count} queries\nAnd there were #{@query_alerts.count} queries that couldn't be optimised or are using default weightings."
    begin
      client.chat_postMessage(channel: '#searchbee', text: msg, as_user: true)
    rescue Exception => e
      logger.info "[IMPORTER] slack failed #{e}"
    end
  end

  def _get_keyword_rpc(logger, token, site, adgroup_id)
    headers = {'Authorization': "Token #{token}", 'content_type': 'application/json'}
    form_data = {
      "datasource": "9__table",
      "viz_type": "table",
      "granularity_sqla": "period_start",
      "since": "3 days ago",
      "until": "now",
      "groupby": [
        "keyword_id",
        "adgroup_id"
      ],
      "metrics": [
        "revenue_per_impression",
        "revenue_per_click",
        "clicks sum",
        "impressions sum"
      ],
      "percent_metrics": [],
      "row_limit": 10000,
      "include_time": false,
      "order_desc": true,
      "all_columns": [],
      "order_by_cols": [],
      "adhoc_filters": [
        {
          "expressionType": "SIMPLE",
          "subject": "project_id",
          "operator": "==",
          "comparator": "searchbe.com",
          "clause": "WHERE",
          "fromFormData": true,
          "filterOptionName": "filter_9emmrilqafp_4vwhe2ilccx"
        },
        {
          "expressionType": "SIMPLE",
          "subject": "adgroup_id",
          "operator": "==",
          "comparator": "#{adgroup_id}",
          "clause": "WHERE",
          "fromFormData": true,
          "filterOptionName": "filter_4tt0mctf8ku_npx5sov8i2"
        }
      ],
      "table_timestamp_format": "%Y-%m-%d %H:%M:%S",
      "page_length": 0,
      "include_search": false,
      "table_filter": false,
      "align_pn": false,
      "color_pn": true,
      "having_filters": [],
      "url_params": {},
      "having": "",
      "filters": [
        {
          "op": "==",
          "col": "project_id",
          "val": "searchbe.com"
        }
      ]
    }

    r = (RestClient::Request.execute(
      :method => :get,
      :url => "https://groovyreports.com/superset/explore_json/?form_data=#{URI.encode(form_data.to_json)}",
      :headers => headers
    ))

    logger.info "[IMPORTER] Got rpcs for #{adgroup_id}"
    return JSON.parse(r)['data']['records']
  end

  def _get_adgroup_ids(logger, token, site)
    headers = {'Authorization': "Token #{token}", 'content_type': 'application/json'}
    form_data = {
      "datasource": "9__table",
      "viz_type": "table",
      "granularity_sqla": "period_start",
      "since": "2 days ago",
      "until": "now",
      "groupby": [
        "campaign_id",
        "adgroup_id"
      ],
      "metrics": [
        {
          "expressionType": "SIMPLE",
          "column": {
            "expression": "",
            "groupby": false,
            "filterable": false,
            "is_dttm": false,
            "column_name": "clicks",
            "type": "FLOAT",
            "optionName": "_col_clicks"
          },
          "aggregate": "SUM",
          "hasCustomLabel": false,
          "fromFormData": false,
          "label": "SUM(clicks)",
          "optionName": "metric_tyfbpgglwas_i15kdpwd3ug"
        }
      ],
      "percent_metrics": [],
      "row_limit": 10000,
      "include_time": false,
      "order_desc": true,
      "all_columns": [],
      "order_by_cols": [],
      "adhoc_filters": [
        {
          "expressionType": "SIMPLE",
          "subject": "project_id",
          "operator": "==",
          "comparator": "searchbe.com",
          "clause": "WHERE",
          "fromFormData": true,
          "filterOptionName": "filter_9emmrilqafp_4vwhe2ilccx"
        }
      ],
      "table_timestamp_format": "%Y-%m-%d %H:%M:%S",
      "page_length": 0,
      "include_search": false,
      "table_filter": false,
      "align_pn": false,
      "color_pn": true,
      "url_params": {}
    }

    r = (RestClient::Request.execute(
      :method => :get,
      :url => "https://groovyreports.com/superset/explore_json/?form_data=#{URI.encode(form_data.to_json)}",
      :headers => headers
    ))
    logger.info "[IMPORTER] Got Adgroups"

    return JSON.parse(r)['data']['records']
  end

  def _get_token(logger)
   payload = {
      username: 'bot',
      password: Rails.application.credentials.production[:gbot][:password]
    }

    r = (RestClient::Request.execute(
      :method => :post,
      :url => "https://groovyreports.com/session",
      :payload => payload.to_json,
      :headers => {:content_type => 'application/json'}
    ))
    logger.info "[IMPORTER] Got Token"

    return JSON.parse(r)['token']
  end


end
