require "rails_helper"

RSpec.describe "API v1 licenses routing", type: :routing do

  it "routes /api/licenses to the api/v1/licenses controller" do
    expect(get: "/api/licenses").to route_to(controller: "api/v1/licenses", action: "index", format: "json")
  end

  it "routes /api/licenses/:id to the api/v1/licenses controller" do
    expect(get: "/api/licenses/1").to route_to(controller: "api/v1/licenses", action: "show", id: "1", format: "json")
  end

end
