require "active_resource_helper"

module DdrAux::TestHelper
  RSpec.describe Language do

    before(:all) { ::Language.create(code: "cym", label: "Welsh") }

    after(:all) { ::Language.destroy_all }

    it "retrieves all records" do
      expect(Language.all).to be_present
    end

    it "finds a record" do
      expect(Language.find(1)).to be_present
    end

    it "searches records" do
      expect(Language.where(code: "cym")).to be_present
    end

  end
end
