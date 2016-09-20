require "rails_helper"
require "active_resource_helper"

module DdrAux::TestHelper
  RSpec.describe ExternalUrl do

    it "retrieves all records" do
      expect(ExternalUrl.all).to be_present
    end

    it "finds a record" do
      expect(ExternalUrl.find(1)).to be_present
    end

    it "searches records" do
      expect(ExternalUrl.where(url: "http://guides.library.duke.edu/eaa")).to be_present
    end

  end
end
