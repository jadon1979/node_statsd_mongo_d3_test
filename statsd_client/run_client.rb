
# per /statsd/config.js
host = 'localhost'
port = 8125

require './simple_udp_client'

page_count = 1

3.times do |idx|
  api_key = "client_#{idx + 1}_api_key"  

  4.times do |page_id|
 
    page_path = "#{api_key}.page_#{page_count}"    
    SimpleUDPClient.new.tap do |client|
      messages = [
        "#{page_path}.bounce_rate:#{rand 100}|c\n",
        "#{page_path}.conversion_rate:#{rand 100}|g\n",
        "#{page_path}.visitors:#{rand 1000}|c\n"
      ]
      client.send_message messages.join
    end
    
    page_count += 1
  end

end
