require "net-ldap"
require "delegate"

module DdrAux
  class LdapGateway

    DEFAULT_SCOPE = Net::LDAP::SearchScope_SingleLevel

    class Error < ::StandardError; end

    class NotFound < Error; end

    class SearchError < Error
      def initialize(op_result)
        message = op_result.error_message || op_result.message
        super(message)
      end
    end

    class << self
      attr_writer :attributes, :scope

      def attributes
        @attributes ||= ENV["LDAP_ATTRIBUTES"].to_s.split
      end

      def scope
        @scope ||= (ENV["LDAP_SCOPE"] || DEFAULT_SCOPE).to_i
      end
    end

    attr_reader :ldap, :attributes, :scope

    def initialize(options={})
      @attributes = options.delete(:attributes) || self.class.attributes
      @scope      = options.delete(:scope)      || self.class.scope
      @ldap = Net::LDAP.new config.merge(options)
    end

    def find(key, value)
      filter = Net::LDAP::Filter.eq(key, value)
      search scope: scope, filter: filter, size: 1, attributes: attributes
    end

    def search(params)
      result_set = ldap.search(params)
      if result_set.nil?
        raise SearchError.new(ldap.get_operation_result)
      end
      if result_set.empty?
        raise NotFound, "Search params: #{params}"
      end
      Result.new(result_set.first)
    end

    # Wraps Net::LDAP::Entry
    # @api private
    class Result < SimpleDelegator
      def to_h
        attribute_names.map { |a| [a, send(a)] }.to_h
      end
    end

    private

    def config
      { host: ENV["LDAP_HOST"],
        port: ENV["LDAP_PORT"],
        base: ENV["LDAP_BASE"],
        auth:
          { method: :simple,
            username: ENV["LDAP_USER"],
            password: ENV["LDAP_PASSWORD"]
          },
        encryption: { method: :simple_tls }
      }
    end

  end
end
