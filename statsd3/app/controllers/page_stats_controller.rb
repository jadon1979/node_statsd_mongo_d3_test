class PageStatsController < ApplicationController

  respond_to :json, :html

  def index    
    @user = User.find(params[:user_id])
    @page = Page.find(params[:page_id])
    require 'mongo_database'
    require 'page_stats'
    require 'page_metric_fetcher'

    pmf_args = { document: @user.api_key, page_id: @page.id }
    page_metric_fetcher = PageMetricFetcher.new(pmf_args)
    flag = params[:flag]
    metric_var = params[:metric_var]
    render json: page_metric_fetcher.fetch_metric(flag, metric_var)
  end

  def show

  end

end