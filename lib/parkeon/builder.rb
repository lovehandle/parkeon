module Parkeon
  class Builder

    def self.build(method_name, &block)
      new(method_name).build(&block)
    end

    def initialize(method_name)
      @method_name = method_name
    end

    def build(&block)
      Nokogiri::XML::Builder.new do |xml|
        xml.methodCall {
          xml.methodName method_name 
          xml.params {
            xml.param {
              xml.value {
                xml.struct {
                  block.call(xml)              
                } 
              } 
            } 
          }
        } 
      end.to_xml
    end

    private

    attr_accessor :method_name

  end
end
