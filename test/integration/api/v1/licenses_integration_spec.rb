require "active_resource_helper"

module DdrAux::TestHelper
  RSpec.describe License do

    it "retrieves all records" do
      expect(License.all).to be_present
    end

    it "finds a record" do
      expect(License.find(1)).to be_present
    end

    it "searches records" do
      expect(License.where(url: "https://creativecommons.org/publicdomain/zero/1.0/")).to be_present
    end

  end
end
