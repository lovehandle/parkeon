module Parkeon
  class Ticket

    SELECTOR = "member value array struct"

    include Virtus

    attribute :id,             Integer
    attribute :zone,           Integer
    attribute :user_type,      Integer
    attribute :plate,          String
    attribute :utc_start_time, DateTime
    attribute :utc_end_time,   DateTime

    def self.all
      session  = Session.create
      response = session.invoke("get_tickets") {}
      response.all(SELECTOR).map {|node| from_node(node) }
    end

    def self.from_node(node)
      attributes = {}
      node.css("member").each do |member|
        attributes[member.at_css("name").text] = member.at_css("value").text
      end
      new(attributes)
    end

  end
end
