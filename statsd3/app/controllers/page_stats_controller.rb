class PageStatsController < ApplicationController

  respond_to :json

  def index    
    @user = User.find(params[:user_id])
    @page = Page.find(params[:page_id])
    require 'mongo_database'
    require 'page_stats'
    require 'page_metric_fetcher'

    pmf_args = { document: @user.api_key, page_id: @page.id }
    page_metric_fetcher = PageMetricFetcher.new(pmf_args)
    stat_lookup = params[:stat]
    render json: page_metric_fetcher.send("fetch_#{stat_lookup}_json")
  end

end