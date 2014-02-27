require 'spec_helper'
require 'mongo_database'

describe MongoDatabase do

  before :each do 
    subject.host = '127.0.0.1'
    subject.document = 'client_1_api_key'
  end

  it 'should retrieve a mongo database' do
    subject.connect
    document = subject.retrieve_document
    expect(document.class).to eql Mongo::DB
  end

end