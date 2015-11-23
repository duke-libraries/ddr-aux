require "ddr_aux/ldap_gateway"

module Api::V1
  class DirectoryController < BaseController

    before_action :api_authenticate

    rescue_from DdrAux::LdapGateway::NotFound, with: :not_found

    private

    def ldap
      @ldap ||= DdrAux::LdapGateway.new
    end

  end
end
