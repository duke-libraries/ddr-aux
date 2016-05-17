require "ddr_aux/ldap_gateway"
require "ddr_aux/grouper/gateway"

module Api::V1
  class DirectoryController < BaseController

    api_authenticate

    rescue_from DdrAux::LdapGateway::NotFound, with: :not_found
    rescue_from DdrAux::Grouper::ClientError, with: :bad_request

    private

    def ldap
      @ldap ||= DdrAux::LdapGateway.new
    end

    def grouper
      @grouper ||= DdrAux::Grouper::Gateway.new
    end

  end
end
