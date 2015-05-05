require "rails_helper"

RSpec.describe "API routing", type: :routing do
  describe "services" do
    it "should have an index route" do
      @route = {controller: "api/services", action: "index"}
      expect(get: '/api').to route_to(@route)
    end
  end

  describe "admin_entities" do
    it "should have a show route" do
      @route = {controller: "api/admin_entities", action: "show", id: "foobar"}
      expect(get: '/api/admin_entities/foobar').to route_to(@route)
    end
    it "should have an index route" do
      @route = {controller: "api/admin_entities", action: "index"}
      expect(get: '/api/admin_entities').to route_to(@route)
    end
  end
end
