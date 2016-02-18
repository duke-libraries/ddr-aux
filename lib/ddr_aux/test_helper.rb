require "active_resource"

module DdrAux
  module TestHelper

    class TestResource < ActiveResource::Base
      self.site = "http://localhost:3000/api"
    end

    class AdminSet < TestResource
    end

    class Contact < TestResource
    end

    class Identifier < TestResource
    end

    class License < TestResource
    end

  end
end
