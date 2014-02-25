require './statsd_client'
require 'json'
require 'open-uri'

config = {
  statsd_host: 'localhost',
  statsd_port: 8125,
  users_pages: 'http://127.0.0.1:3000/users_pages'
}

# Get all Users' Pages in json format from the server
users_pages = open(config[:users_pages])

# Parse data
json_data = JSON.parse(users_pages.read)

json_data.each.with_index do |user_data|
  api_key = user_data['api_key']
  pages   = user_data['pages']
  pages.each do |page|
    path = "#{api_key}.page_#{page['id']}"    
    StatsdClient.new.tap do |client|
      client.send_gauges("#{path}_conversion_rate:#{rand 100}")
      client.send_counters("#{path}_bounce_rate:#{rand 100}")
      client.send_counters("#{path}_visitors:#{rand 100}")
      client.send_timers("#{path}_visitation_times:#{rand 1000..10000}")      
    end
  end
end
