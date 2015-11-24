require "rails_helper"
require "active_resource_helper"

module ActiveResourceHelper
  RSpec.describe AdminSet do

    before(:all) { ::AdminSet.create(code: "foo", title: "Foo") }

    after(:all) { ::AdminSet.destroy_all }

    it "retrieves all records" do
      expect(AdminSet.all).to be_present
    end

    it "finds a record" do
      expect(AdminSet.find(1)).to be_present
    end

    it "searches records" do
      expect(AdminSet.where(code: "foo")).to be_present
    end

  end
end
