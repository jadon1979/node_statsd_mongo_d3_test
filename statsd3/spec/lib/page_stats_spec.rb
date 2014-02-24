require 'spec_helper'
require 'bson'
require 'ostruct'
require 'page_stats'

describe PageStats do 

  let(:page_id)  { 1 }
  let(:counters) { [{ "time"=>1393225232, "count"=>2  }] }
  let(:gauges)   { [{ "time"=>1393225252, "gauge"=>50 }] }

  it 'should retrieve a counters json' do
    counters_doc = OpenStruct.new(find: counters)
    document = { "counters.page_#{page_id}.bounce_rate_10" => counters_doc }

    PageStats.new({ document: document, page_id: page_id }).tap do |ps|
      stats = ps.fetch_stat_json "counters", "bounce_rate_10", "count"
      JSON.parse(stats).tap do |stat|
        stat.first['data'].should =~ /counters/
        stat.first['value'].should == 2
        stat.first['time'].should eql 1393225232
      end
    end
  end

  it 'should retrieve a gauges_json' do
    gauges_doc = OpenStruct.new(find: gauges)
    document = { "gauges.page_#{page_id}.conversion_rate_10" => gauges_doc }

    PageStats.new({ document: document, page_id: page_id }).tap do |ps|
      stats = ps.fetch_stat_json "gauges", "conversion_rate_10", "gauge"
      JSON.parse(stats).tap do |stat|
        stat.first['data'].should =~ /gauges/
        stat.first['value'].should == 50
        stat.first['time'].should eql 1393225252
      end
    end
  end

end