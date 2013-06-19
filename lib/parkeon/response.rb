module Parkeon
  class Response

    SUCCESS_CODE = "200".freeze

    def initialize(response)
      @response = response
    end

    def find(selector)
      xml.at_css(selector)
    end

    def all(selector)
      xml.css(selector)
    end

    def code
      response.code
    end

    def success?
      code == SUCCESS_CODE
    end

    private

    attr_reader :response

    def body
      response.body
    end

    def xml
      Nokogiri::XML(body)
    end

  end
end
