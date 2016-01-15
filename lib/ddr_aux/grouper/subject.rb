require "hashie"
require_relative "gateway"

module DdrAux::Grouper
  class Subject < Hashie::Trash

    ATTRIBUTES = %w( displayName uid duDukeId eduPersonPrimaryAffiliation )

    property :name,                from: "displayName"
    property :net_id,              from: "uid"
    property :unique_id,           from: "duDukeId"
    property :primary_affiliation, from: "eduPersonPrimaryAffiliation"

    def initialize(attrs)
      init_hash = ATTRIBUTES.zip(attrs).to_h
      super(init_hash)
    end

    def groups
      grouper.groups(subject: net_id)
    end

    private

    def grouper
      @grouper ||= Gateway.new
    end

  end
end
