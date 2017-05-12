require "active_resource_helper"

module DdrAux::TestHelper
  RSpec.describe RightsStatement do

    it "retrieves all records" do
      expect(RightsStatement.all).to be_present
    end

    it "finds a record" do
      expect(RightsStatement.find(1)).to be_present
    end

    it "searches records" do
      expect(RightsStatement.where(url: "https://creativecommons.org/publicdomain/zero/1.0/")).to be_present
    end

  end
end
