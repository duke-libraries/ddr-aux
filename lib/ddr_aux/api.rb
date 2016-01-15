module DdrAux
  module Api

    def self.api_auth_enabled
      !!ENV["API_AUTH_ENABLED"]
    end

  end
end
