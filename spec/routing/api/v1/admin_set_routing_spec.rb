require "rails_helper"

RSpec.describe "API V1 admin_sets routing", type: :routing do

  it "routes /api/admin_sets to the api/v1/admin_sets controller" do
    expect(get: "/api/admin_sets").to route_to(controller: "api/v1/admin_sets", action: "index", format: "json")
  end

  it "routes /api/admin_sets/{id} to the api/v1/admin_sets controller" do
    expect(get: "/api/admin_sets/1").to route_to(controller: "api/v1/admin_sets", action: "show", id: "1", format: "json")
  end

  it "routes /api/admin_sets/find to the api/v1/admin_sets controller" do
    expect(get: "/api/admin_sets/find?code=dc").to route_to(controller: "api/v1/admin_sets", action: "find", code: "dc", format: "json")
  end

end
