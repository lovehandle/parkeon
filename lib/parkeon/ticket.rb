module Parkeon
  class Ticket

    # INCLUSIONS

    include Virtus

    # CONSTANTS

    BASE_SELECTOR = "member value array struct"
    ATTR_SELECTOR = "member"
    ATTR_NAME_SELECTOR = "name"
    ATTR_VALUE_SELECTOR = "value"

    # ATTRIBUTES

    attribute :id,             Integer
    attribute :zone,           Integer
    attribute :user_type,      Integer
    attribute :plate,          String
    attribute :utc_start_time, DateTime
    attribute :utc_end_time,   DateTime

    # CLASS METHODS

    def self.all
      get_tickets.css(BASE_SELECTOR).map {|node| from_node(node) }
    end

    def self.from_node(node)
      attributes = {}

      node.css(ATTR_SELECTOR).each do |member|
        key   = member.at_css(ATTR_NAME_SELECTOR).try(:text)
        value = member.at_css(ATTR_VALUE_SELECTOR).try(:text)

        if key && value
          attributes[key] = value
        end
      end

      new(attributes)
    end

    private

    def self.get_tickets
      Session.create.invoke("get_tickets") {}
    end

  end
end
