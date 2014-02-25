class MetricVariable < ActiveRecord::Base

  METRIC_FLAGS = [['gauges','g'], ['counters','c'], ['timers','ms'], ['sets','s']]

end
