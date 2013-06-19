require "net/http"
require "uri"

module Parkeon
  class Client

    def self.post(*args)
      new(*args).post
    end

    def initialize(body)
      @body = body
    end

    def post
      request = Net::HTTP::Post.new(uri.request_uri)
      request.body = body
      Response.new https.request(request)
    end

    private

    attr_reader :body

    def https
      Net::HTTP.new(uri.host, uri.port).tap { |client| client.use_ssl = true }
    end

    def uri
      URI(endpoint)
    end

    def endpoint
      Config.endpoint
    end

  end
end
