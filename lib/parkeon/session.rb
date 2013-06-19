module Parkeon
  class Session

    def self.create
      response =
        Gateway.create_session do |xml|
          xml.member {
            xml.name "requester"
            xml.value {
              xml.string Config.requester 
            }
          }
          xml.member {
            xml.name "service" 
            xml.value {
              xml.string Config.service 
            }
          }
          xml.member {
            xml.name "version" 
            xml.value {
              xml.i4 Config.version 
            }
          }
        end

      new( response.find("member value i4").text ) if response.success?
    end

    def initialize(session_id)
      @session_id = session_id
    end

    def invoke(method, &block) 
      Gateway.invoke_session do |xml|
        xml.member {
          xml.name "session_id" 
          xml.value {
            xml.i4 session_id 
          }
        }

        xml.member {
          xml.name "method" 
          xml.value {
            xml.string method 
          }
        }

        xml.member {
          xml.name "parameters" 
          xml.value {
            xml.struct {
              block.call(xml) 
            } 
          }
        }
      end
    end

    def terminate
      Gateway.terminate_session do |xml|
        xml.member {
          xml.name "session_id" 
          xml.value {
            xml.i4 session_id 
          }
        }
      end
    end

    private

    attr_reader :session_id

  end
end
