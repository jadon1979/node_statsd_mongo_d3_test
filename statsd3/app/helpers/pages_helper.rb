module PagesHelper
  
  def page_stat_path(stat)
    user_page_page_stats_path(@user, @page, stat: stat)
  end

end
