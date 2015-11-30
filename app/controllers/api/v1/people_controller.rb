require "ddr_aux/ldap_gateway"

module Api::V1
  class PeopleController < DirectoryController

    def find
      key = params.require(:key)
      value = params.require(:value)
      result = ldap.find(key, value)
      render json: result.to_h
    end

  end
end
