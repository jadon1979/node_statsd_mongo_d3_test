
class PageStats
  include Mongo

  attr_reader :document, :page_id

  def initialize(options = {})
    @document = options[:document]
    @page_id  = options[:page_id]
  end

  # category: counters, gauges, sets, timers, etc
  # var_name: bounce_rate_10, conversion_rate_10, etc
  # field:    field name to use in json (Count, Gauge, etc)
  def fetch_stat_json(category, var_name, field)
    doc = @document["#{category}.page_#{@page_id}.#{var_name}"].find
    build_json(category, doc, field).to_json
  end

  private

    def build_json(category, doc, field)
      doc.map do |d| 
        { 
          data: category, 
          time: DateTime.strptime(d['time'].to_s, '%s').strftime('%m-%d-%y %H:%M:%S'), 
          value: d[field] 
        } 
      end
    end

end