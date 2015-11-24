require "active_resource_helper"

module ActiveResourceHelper
  RSpec.describe Contact do

    it "retrieve all records" do
      expect(Contact.all).to be_present
    end

    it "finds a record" do
      expect(Contact.find(1)).to be_present
    end

    it "searches records" do
      expect(Contact.where(url: "http://library.duke.edu")).to be_present
    end

  end
end
