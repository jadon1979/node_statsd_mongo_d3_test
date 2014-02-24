require 'spec_helper'
require 'page_metric_fetcher'

describe PageMetricFetcher do
  
  subject do 
    PageMetricFetcher.new({ document: 'client_1_api_key', page_id: 1 })
  end

  it 'should fetch the bounce rates json' do
    stats = subject.fetch_bounce_rates_json
    # JSON.parse(stats).tap do |stat|
    #   stat.first['data'].should =~ /counters/
    #   stat.first['value'].should == 12
    #   stat.first['time'].should eql 1393244084
    # end
  end

  it 'should fetch the conversion rates json' do
    stats = subject.fetch_conversion_rates_json
    # JSON.parse(stats).tap do |stat|
    #   stat.first['data'].should =~ /gauges/
    #   stat.first['value'].should == 63
    #   stat.first['time'].should eql 1393244084
    # end
  end

  it 'should fetch the visitors rates json' do
    stats = subject.fetch_visitor_rates_json
    # JSON.parse(stats).tap do |stat|
    #   stat.first['data'].should =~ /counters/
    #   stat.first['value'].should == 606
    #   stat.first['time'].should eql 1393244084
    # end
  end

end