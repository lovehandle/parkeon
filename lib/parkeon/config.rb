module Parkeon
  class Config
    class << self
      attr_accessor :endpoint, :requester, :version, :service

      def configure(&block)
        yield self if block_given?
      end
    end
  end
end
