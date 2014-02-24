require 'spec_helper'
require 'mongo_database'

describe MongoDatabase do

  before :each do 
    subject.host = '127.0.0.1'
    subject.document = 'client_1_api_key'
  end

  it 'should error if unable to connect to a mongodb server' do
    subject.host = '1.1.1.1'
    -> { subject.connect }.should raise_error(Mongo::ConnectionFailure) 
  end

  it 'should retrieve a mongo database' do
    subject.connect
    document = subject.retrieve_document
    expect(document.class).to eql Mongo::DB
  end

end