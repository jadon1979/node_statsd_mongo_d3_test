class PageMetricsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @page = Page.find(params[:page_id])
    @metrics = MetricVariable.all
    
    @stats_path = user_page_page_stats_path(@user, @page)
    @metric_flag = params[:flag]
    @metric_var  = params[:metric]
  end

end