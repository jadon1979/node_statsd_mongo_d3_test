
class PageMetricFetcher
  include Mongo

  #Appended via statsd on insert
  METRIC_APPENDAGE = '_10'

  attr_reader :mongo_database, :document, :page_stats, :page_id

  def initialize(options = {})
    @document = options[:document]
    @page_id  = options[:page_id]
    @mongo_database = options[:mongo_database]
    @page_stats = options[:page_stats]
    connect
  end

  def fetch_metric(metric_flag, var_name)
    var_name = var_name << METRIC_APPENDAGE
    document = @mongo_database.retrieve_document
    @page_stats = page_stats.new({ document: document, page_id: @page_id })
    page_stats.fetch_stat_json(metric_flag, var_name)
  end

  private

    def connect
      @mongo_database = mongo_database.new({ document: @document })
      @mongo_database.connect
    end

    def mongo_database
      @mongo_database ||= MongoDatabase
    end

    def page_stats
      @page_stats ||= PageStats
    end 

end