require 'spec_helper'
require 'page_metric_fetcher'

describe PageMetricFetcher do
  
  let(:counters_doc) { OpenStruct.new(find: counters) }
  let(:document) {{ "counters.page_1_bounce_rate_10" => counters_doc }}

  subject do 
    PageMetricFetcher.new({ document: 'client_1_api_key', page_id: 1 })
  end

  it 'should fetch the bounce rates json' do
    stats = subject.fetch_metric('c', 'bounce_rate')
    stats.should_not be_empty
    JSON.parse(stats).tap do |stat|
      stat.first['data'].should =~ /counters/
    end
  end

end