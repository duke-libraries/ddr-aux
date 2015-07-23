require "rails_helper"

RSpec.describe "API routing", type: :routing do

  describe "organizations" do
    it "should have a show route" do
      route = {controller: "api/organizations", action: "show", id: "1"}
      expect(get: '/organizations/1').to route_to(route)
    end
    it "should have an index route" do
      route = {controller: "api/organizations", action: "index"}
      expect(get: '/organizations').to route_to(route)
    end
  end

  describe "services" do
    it "should have a 'contacts' route" do
      expect(get: '/contacts').to route_to(controller: "api/services", action: "contacts")
    end
  end

end
