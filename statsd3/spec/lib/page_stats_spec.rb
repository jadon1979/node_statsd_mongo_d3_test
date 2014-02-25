require 'spec_helper'
require 'bson'
require 'ostruct'
require 'page_stats'

describe PageStats do 

  let(:page_id)  { 1 }
  let(:counters) { [{ "time"=>1393225232, "count"=>2  }] }
  let(:gauges)   { [{ "time"=>1393225252, "gauge"=>50 }] }

  it 'should retrieve a json formatted counter variable' do
    counters_doc = OpenStruct.new(find: counters)
    document = { "counters.page_#{page_id}_bounce_rate_10" => counters_doc }

    PageStats.new({ document: document, page_id: page_id }).tap do |ps|
      stats = ps.fetch_stat_json "c", "bounce_rate_10"
      JSON.parse(stats).tap do |stat|
        stat.first['data'].should =~ /counters/
        stat.first['value'].should == 2
        stat.first['time'].should =~ /02-24-14 07:00:32/
      end
    end
  end

  it 'should retrieve a json formatted gauge variable' do
    gauges_doc = OpenStruct.new(find: gauges)
    document = { "gauges.page_#{page_id}_conversion_rate_10" => gauges_doc }

    PageStats.new({ document: document, page_id: page_id }).tap do |ps|
      stats = ps.fetch_stat_json "g", "conversion_rate_10"
      JSON.parse(stats).tap do |stat|
        stat.first['data'].should =~ /gauges/
        stat.first['value'].should == 50
        stat.first['time'].should =~ /02-24-14 07:00:52/
      end
    end
  end

end