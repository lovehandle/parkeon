module Parkeon
  class Gateway

    def self.define_service(method_name, verb)
      self.class.instance_eval do
        define_method(method_name) do |&block|
          Client.send(verb, Builder.build(method_name, &block))
        end
      end
    end

    define_service :create_session, :post
    define_service :invoke_session, :post
    define_service :terminate_session, :post

  end
end
