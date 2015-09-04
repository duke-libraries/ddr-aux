require "rails_helper"

RSpec.describe "API v1 license routing", type: :routing do

  it "routes /api/licenses to the api/v1/licenses controller" do
    expect(get: "/api/licenses").to route_to(controller: "api/v1/licenses", action: "index", format: "json")
  end

  it "routes /api/licenses/code to the api/v1/licenses controller" do
    expect(get: "/api/licenses/code").to route_to(controller: "api/v1/licenses", action: "show", code: "code", format: "json")
  end

end
