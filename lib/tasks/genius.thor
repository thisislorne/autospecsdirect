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

    # create default weightings
    Query.all.each do |q|
      oq = OptimisedQuery.find_or_create_by(query_id: q.id, adgroup_id: 'default')
      oq.weighting = q.weighting
      oq.save!
    end

    token = _get_token(logger)
    queries = _get_keyword_rpcs(logger, token, site)

    queries.each do |query|
      begin
        q = Query.where(query_stripped: query['keyword_id'].downcase).first
        next unless q.present?
        next unless q.enabled
        
        logger.info "[IMPORTER] Clicks for #{q.query} #{query['SUM_clicks_']}"

        oq = OptimisedQuery.find_or_create_by(query_id: q.id, adgroup_id: query['adgroup_id'])

        oq.rpi = query['revenue_per_impression']
        optimised_weighting = ((oq.rpi + 1) ** 10 -1) * 10
        optimised_default = optimised_weighting + q.weighting
        oq.weighting = optimised_default
        oq.rpc = query['revenue_per_click']
        oq.clicks = query['SUM_clicks_']
        oq.impressions = query['impressions_sum']
        oq.save!

        logger.info "[IMPORTER] adgroup_id #{query['adgroup_id']} done"
      rescue Exception => e
        logger.info "[IMPORTER] failed on #{query['keyword_id']} - #{query['adgroup_id']}"
        logger.info "#{e}"
      end    
    end

    _slack_notify(site)
    
    logger.info "[IMPORTER] done done"
  end

  private

  def _slack_notify(site)
    client = Slack::Web::Client.new
    msg = "Optimiser has run for #{site} - #{Rails.env}"
    begin
      client.chat_postMessage(channel: '#searchbee', text: msg, as_user: true)
    rescue Exception => e
      logger.info "[IMPORTER] slack failed #{e}"
    end
  end

  def _get_keyword_rpcs(logger, token, site)
    headers = {'Authorization': "Token #{token}", 'content_type': 'application/json'}

    form_data = {
      "datasource": "9__table",
      "viz_type": "table",
      "granularity_sqla": "period_start",
      "since": "3 days ago",
      "until": "now",
      "groupby": [
        "adgroup_id",
        "keyword_id"
      ],
      "metrics": [
        {
          "expressionType": "SIMPLE",
          "column": {
            "expression": "",
            "filterable": false,
            "groupby": false,
            "column_name": "clicks",
            "type": "FLOAT",
            "is_dttm": false,
            "optionName": "_col_clicks"
          },
          "aggregate": "SUM",
          "hasCustomLabel": false,
          "fromFormData": true,
          "label": "SUM(clicks)",
          "optionName": "metric_tyfbpgglwas_i15kdpwd3ug"
        },
        "revenue_per_impression",
        "revenue_per_click",
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
          "comparator": site,
          "clause": "WHERE",
          "fromFormData": true,
          "filterOptionName": "filter_9emmrilqafp_4vwhe2ilccx"
        },
        {
          "expressionType": "SIMPLE",
          "subject": "adgroup_id",
          "operator": "IS NOT NULL",
          "comparator": "",
          "clause": "WHERE",
          "fromFormData": true,
          "filterOptionName": "filter_lankvzvxoc_inw8mph8zsk"
        },
        {
          "expressionType": "SQL",
          "sqlExpression": "SUM(clicks) > 2",
          "clause": "HAVING",
          "fromFormData": true,
          "filterOptionName": "filter_a9mnd9dit4_83yhr5f9eab"
        }
      ],
      "table_timestamp_format": "%Y-%m-%d %H:%M:%S",
      "page_length": 0,
      "include_search": false,
      "table_filter": false,
      "align_pn": false,
      "color_pn": true,
      "where": "",
      "url_params": {
        
      },
      "having_filters": [],
      "filters": [
        {
          "op": "==",
          "col": "project_id",
          "val": site
        }
      ],
      "having": ""
    }
    
    r = (RestClient::Request.execute(
      :method => :get,
      :url => "https://groovyreports.com/superset/explore_json/?form_data=#{URI.encode(form_data.to_json)}",
      :headers => headers
    ))

    logger.info "[IMPORTER] Got rpcs"
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
