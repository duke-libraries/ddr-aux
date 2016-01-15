require "hashie"
require_relative "gateway"

module DdrAux::Grouper
  class Group < Hashie::Trash

    property "name"
    # => "org:dept:app:special_group"

    property "label", from: "displayExtension"
    # => "Special Group"

    property "description"
    # => "Members have special powers"

    property "uuid"
    # => "6b2969f32b9f40bea342fd98881df8c8"

    property "short_name", from: "extension"
    # => "special_group"

    property "display_name", from: "displayName"
    # => "Organization:Department:Application:Special Group"

    def members
      grouper.members(name)
    end

    private

    def grouper
      @grouper ||= Gateway.new
    end

  end
end
