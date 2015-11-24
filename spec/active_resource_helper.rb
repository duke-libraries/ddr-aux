require "spec_helper"
require "active_resource"
require "ezid/test_helper"

ezid_test_mode!

module ActiveResourceHelper

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
