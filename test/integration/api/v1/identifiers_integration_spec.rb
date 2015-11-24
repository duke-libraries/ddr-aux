require "active_resource_helper"

module ActiveResourceHelper
  RSpec.describe Identifier do

    before(:all) do
      @ezid = Ezid::Identifier.create
    end

    it "finds a record" do
      expect(Identifier.find(@ezid.id)).to be_present
    end

  end
end
