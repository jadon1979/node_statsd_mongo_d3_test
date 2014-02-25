module PageMetricsHelper

  def default_to_first_metric(flag, metric)
    if @metric_flag.nil? || @metric_flag.empty?
      @metric_flag = flag
      @metric_var  = metric
    end
  end

  def generate_tabs
    content_tag(:ul, class: 'nav nav-tabs', id: 'metric_tabs') do
      @metrics.each_with_index do |metric, idx|        
        default_to_first_metric(metric.metric_abr, metric.name) if idx == 0
        css_class = 'active' if @metric_var == metric.name

        concat content_tag(:li, 
          content_tag(:a, metric.name,
            href: "?flag=#{metric.metric_abr}&metric=#{metric.name}",
          ),
          class: css_class     
        )
      end
    end
  end

end