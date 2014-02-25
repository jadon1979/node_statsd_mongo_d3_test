require './statsd_client'
require 'json'
require 'net/http'

config = {
  statsd_host: 'localhost',
  statsd_port: 8125,
  users_pages: 'http://localhost:3000/users_pages',
  metric_vars: 'http://localhost:3000/metric_variables'
}

puts 'Gathering user page data'
users_pages      = Net::HTTP.get(URI(config[:users_pages]))
json_page_data   = JSON.parse(users_pages)

puts 'Gathering metric variable data'
metric_variables = Net::HTTP.get(URI(config[:metric_vars]))
json_metric_data = JSON.parse(metric_variables)

puts 'Sending metrics to Statsd'
json_page_data.each.with_index do |user_data|
  api_key = user_data['api_key']
  user_data['pages'].each do |page|
    path = "#{api_key}.page_#{page['id']}"
    StatsdClient.new.tap do |client|
      # iterate metric variables and send random values to Statsd
      json_metric_data.each do |metric|        
        message = "#{path}_#{metric['name']}:#{rand 100}"
        client.send_metric message, metric['metric_abr'], metric['sample_rate']
      end
    end
  end
end
