require "grouper-rest-client"
require_relative "group"
require_relative "subject"

module DdrAux::Grouper

  class Error < ::StandardError; end
  class ClientError < Error; end
  class ServerError < Error; end

  class Gateway

    attr_reader :url, :user, :password, :timeout

    def initialize(url: nil, user: nil, password: nil, timeout: nil)
      @url = url || ENV["GROUPER_URL"]
      @user = user || ENV["GROUPER_USER"]
      @password = password || ENV["GROUPER_PASSWORD"]
      @timeout = timeout || ENV.fetch("GROUPER_TIMEOUT", 5).to_i
    end

    def inspect
      super.sub(/@password="[^"]*"/, "@password=\"******\"")
    end

    def group(name)
      if result = grouper.group(name)
        Group.new(result.instance_variable_get("@json"))
      end
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
      results.map { |result| Group.new(result.instance_variable_get("@json")) }
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
      groups = results.map { |result| Group.new(result) }
      if filter
        groups.select! { |group| group.name.start_with?(filter) }
      end
      groups
    end

    def members(group_name)
      request_body = {
        "WsRestGetMembersRequest" => {
          "subjectAttributeNames" => Subject::ATTRIBUTES,
          "wsGroupLookups" => [{"groupName" => group_name}]
        }
      }
      response = handle_response grouper.call("groups", :post, request_body)
      ws_result = response["WsGetMembersResults"]["results"].first
      results = if ws_result && ws_result["wsSubjects"]
                  ws_result["wsSubjects"]
                else
                  []
                end
      results
        .map    { |result| Subject.new(result["attributeValues"]) }
        .reject { |subject| subject.name.blank? }
    end

    private

    def handle_response(response)
      if grouper.ok?
        response
      else
        raise ServerError, response
      end
    end

    def grouper
      @grouper ||= Grouper::Rest::Client::Resource.new(url, user: user, password: password, timeout: timeout)
    end

  end
end
