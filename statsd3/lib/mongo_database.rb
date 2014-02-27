require 'mongo'

class MongoDatabase
  include Mongo

  attr_accessor :host, :port, :document
  attr_reader :mongo_client

  def initialize(options = {})
    @host         = options[:host]
    @port         = options[:port]
    @document     = options[:document]
    @mongo_client = options[:mongo_client]
  end

  def connect
    @mongo_client = mongo_client.new(host, port)
  end

  def retrieve_document
    mongo_client[document]
  end

  private

    def mongo_client
      @mongo_client ||= MongoClient
    end

    def host
      @host ||= '127.0.0.1'
    end

    def port
      @port ||= 27017
    end

    def document
      @document ||= 'test'
    end

end