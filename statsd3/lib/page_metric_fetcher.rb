
class PageMetricFetcher
  include Mongo

  attr_reader :mongo_database, :document, :page_stats, :page_id

  def initialize(options = {})
    @document = options[:document]
    @page_id  = options[:page_id]
    @mongo_database = options[:mongo_database]
    @page_stats = options[:page_stats]
    connect
  end

  def fetch_bounce_rates_json
    fetch_metric("counters", "bounce_rate_10", "count")
  end

  def fetch_visitor_rates_json
    fetch_metric("counters", "visitors_10", "count")
  end

  def fetch_conversion_rates_json
    fetch_metric("gauges", "conversion_rate_10", "gauge")
  end

  private

    def fetch_metric(category, var_name, field)
      document = @mongo_database.retrieve_document
      @page_stats = page_stats.new({ document: document, page_id: @page_id })
      page_stats.fetch_stat_json(category, var_name, field)
    end

    def connect
      @mongo_database = mongo_database.new({ document: @document })
      @mongo_database.connect
    end

    def mongo_database
      @mongo_database || MongoDatabase
    end

    def page_stats
      @page_stats || PageStats
    end 

end