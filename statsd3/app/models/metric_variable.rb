class MetricVariable < ActiveRecord::Base

  METRIC_FLAGS = [['gauges','g'], ['counters','c'], ['timers','ms'], ['sets','s']]

  def self.find_metric_flag_key_by_value(value)
    METRIC_FLAGS.find { |k, v| v == value }.first
  end

end
