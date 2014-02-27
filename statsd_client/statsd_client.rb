require './simple_udp_client'

class StatsdClient < SimpleUDPClient

  METRICS = [['gauges','g'], ['counters','c'], ['timers','ms'], ['sets','s']]

  def post_initialize
    METRICS.each { |metric| StatsdClient.build_method metric[0], metric[1] }
  end

  def send_metric(message, flag, sample_rate)
    msg = "#{message}|#{flag}#{'|@' << sample_rate.to_s if sample_rate < 1}"
    send_message(msg)
  end

  def self.build_method(target, flag)
    define_method("send_#{target}") do |message, sample_rate = 1|
      msg = "#{message}|#{flag}#{'|@' << sample_rate.to_s if sample_rate < 1}"
      send_message(msg)
    end
  end

end


