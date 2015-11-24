require "ddr_aux/ldap_gateway"

module Api::V1
  class DirectoryController < BaseController

    before_action :api_authenticate

    rescue_from DdrAux::LdapGateway::NotFound, with: :not_found
    rescue_from DdrAux::GrouperGateway::ClientError, with: :bad_request

    private

    def ldap
      @ldap ||= DdrAux::LdapGateway.new
    end

    def grouper
      @grouper ||= DdrAux::GrouperGateway.new
    end

  end
end
