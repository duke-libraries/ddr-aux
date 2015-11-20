require "ddr_aux/ldap_gateway"

module Api::V1
  class DirectoryController < BaseController

    rescue_from DdrAux::LdapGateway::NotFound, with: :not_found

    def find
      user_key = params.require(:user_key)
      result = ldap.find("eduPersonPrincipalName", user_key)
      render json: result.to_h
    end

    private

    def ldap
      @ldap ||= DdrAux::LdapGateway.new
    end

  end
end
