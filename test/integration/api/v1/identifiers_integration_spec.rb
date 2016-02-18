require "active_resource_helper"
require "ezid/test_helper"

ezid_test_mode!

module DdrAux::TestHelper
  RSpec.describe Identifier do

    before(:all) do
      @ezid = Ezid::Identifier.create
    end

    it "finds a record" do
      expect(Identifier.find(@ezid.id)).to be_present
    end

  end
end
