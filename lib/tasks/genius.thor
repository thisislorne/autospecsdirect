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

    token = _get_token(logger)
    adgroups = _get_adgroup_ids(logger, token, site)

    adgroups.each do |adgroup|
      begin
        keywords = _get_keyword_rpc(logger, token, site, adgroup['adgroup_id'])
        kw_array = []
        keywords.each do |keyword|
          kw_array.push(keyword['keyword_id'].downcase)
        end
        queries = Query.where(query_stripped: kw_array)

        queries_to_optimise = []

        queries.each do |query|
          next unless query.enabled
          next unless query.optimisation_enabled
          
          keyword = keywords.detect {|k| k['keyword_id'].downcase == query.query_stripped}
          logger.info "[IMPORTER] Clicks for #{query.query} #{keyword['clicks_sum']}"
          next unless keyword['clicks_sum'] > 10


          obj = {
            query_id: query.id,
            revenue_per_impression: keyword['revenue_per_impression']
          }
          queries_to_optimise.push obj
        end

        queries_to_optimise.each do |qto|
          rpi = qto[:revenue_per_impression]
          # rev per imp +1 to the power of 10, -1. 
          optimised_weighting = ((rpi + 1) ** 10 -1) * 10

          oq = OptimisedQuery.find_or_create_by(query_id: qto[:query_id], adgroup_id: adgroup['adgroup_id'])
          oq.weighting = optimised_weighting
          oq.adgroup_id = adgroup['adgroup_id']
          oq.save!
          
          logger.info "[IMPORTER] oq updated #{oq.id} for #{oq.query.query}"
        end  

        logger.info "[IMPORTER] adgroup_id #{adgroup['adgroup_id']} done"
      rescue Exception => e
        logger.info "[IMPORTER] failed on #{adgroup['adgroup_id']}"
      end
      
    end
    logger.info "[IMPORTER] done done"
  end

  private

  def _get_keyword_rpc(logger, token, site, adgroup_id)
    headers = {'Authorization': "Token #{token}", 'content_type': 'application/json'}
    form_data = {
      "datasource": "9__table",
      "viz_type": "table",
      "granularity_sqla": "period_start",
      "since": "3 days ago",
      "until": "now",
      "groupby": [
        "keyword_id"
      ],
      "metrics": [
        "revenue_per_impression",
        "clicks sum"
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
