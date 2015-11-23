require "hashie"
require "grouper-rest-client"

module DdrAux
  class GrouperGateway

    class Error < ::StandardError; end
    class ClientError < Error; end
    class ServerError < Error; end

    class Groups
      def self.call(groups)
        groups.map { |g| Group.new(g) }
      end
    end

    class Group < Hashie::Mash
      def initialize(group)
        if group.instance_variable_defined?("@json")
          super group.instance_variable_get("@json")
        else
          super
        end
      end
    end

    attr_reader :url, :user, :password, :timeout

    def initialize(url: nil, user: nil, password: nil, timeout: nil)
      @url = url || ENV["GROUPER_URL"]
      @user = user || ENV["GROUPER_USER"]
      @password = password || ENV["GROUPER_PASSWORD"]
      @timeout = timeout || ENV.fetch("GROUPER_TIMEOUT", 5).to_i
    end

    def groups(filter: nil, subject: nil)
      if filter.nil? && subject.nil?
        raise ClientError, "DdrAux::GrouperGateway#groups requires `filter` and/or `subject` keyword argument(s)."
      end
      if subject
        groups_by_subject(subject, filter: filter)
      else
        groups_by_filter(filter)
      end
    end

    def groups_by_filter(filter)
      results = handle_response grouper.groups(filter)
      Groups.call(results)
    end

    def groups_by_subject(subject, filter: nil)
      request_body = {
        "WsRestGetGroupsRequest" => {
          "subjectLookups" => [{"subjectIdentifier" => subject}]
        }
      }
      # Have to use :call b/c grouper-rest-client :subjects method doesn't support POST
      response = handle_response grouper.call("subjects", :post, request_body)
      ws_result = response["WsGetGroupsResults"]["results"].first
      results = if ws_result && ws_result["wsGroups"]
                 ws_result["wsGroups"]
               else
                 []
               end
      groups = Groups.call(results)
      if filter
        groups.select! { |group| group.name.start_with?(filter) }
      end
      groups
    end

    private

    def handle_response(response)
      if grouper.ok?
        response
      else
        raise ServerError, response
      end
    end

    def group_attributes(group)
      # Yes, this is awful, but grouper-rest-client is dead.
      group
    end

    def grouper
      @grouper ||= Grouper::Rest::Client::Resource.new(url, user: user, password: password, timeout: timeout)
    end

  end
end
