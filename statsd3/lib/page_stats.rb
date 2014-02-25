
class PageStats
  include Mongo

  attr_reader :document, :page_id

  def initialize(options = {})
    @document = options[:document]
    @page_id  = options[:page_id]
  end

  # category: counters, gauges, sets, timers, etc
  # var_name: bounce_rate_10, conversion_rate_10, etc
  def fetch_stat_json(metric_flag, var_name)
    metric = MetricVariable.find_metric_flag_key_by_value(metric_flag)
    doc = @document["#{metric}.page_#{@page_id}_#{var_name}"].find
    build_json(metric, doc).to_json
  end

  private

    def build_json(metric, doc)      
      doc.map do |data|
        row = data.to_a
        { 
          data: metric, 
          time: DateTime.strptime(row[0][1].to_s, '%s').strftime('%m-%d-%y %H:%M:%S'), 
          value: row[1][1]
        } 
      end
    end

end