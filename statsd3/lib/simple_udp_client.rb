require 'socket'

class SimpleUDPClient

  attr_reader :host, :port, :upd_socket

  def initialize(config = {})
    @host   = config[:host]
    @port   = config[:port]
    @socket = config[:socket]
  end

  def send_message(message)
    socket.new.tap do |udp|
      udp.send(message, 0, host, port)
    end unless message.nil? || message.empty?
  end

  private

    def host
      @host ||= '127.0.0.1'
    end

    def port
      @port ||= 8125
    end

    def socket
      @socket ||= UDPSocket
    end

end