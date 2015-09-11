require "rails_helper"

RSpec.describe "API v1 licenses routing", type: :routing do

  it "routes /api/licenses to the api/v1/licenses controller" do
    expect(get: "/api/licenses").to route_to(controller: "api/v1/licenses", action: "index", format: "json")
  end

  it "routes /api/licenses/:id to the api/v1/licenses controller" do
    expect(get: "/api/licenses/1").to route_to(controller: "api/v1/licenses", action: "show", id: "1", format: "json")
  end

  it "routes /api/licenses/find to the api/v1/licenses controller" do
    expect(get: "/api/licenses/find?url=https%3A%2F%2Fcreativecommons.org%2Fpublicdomain%2Fzero%2F1.0%2F").to route_to(controller: "api/v1/licenses", action: "find", url: "https://creativecommons.org/publicdomain/zero/1.0/", format: "json")
  end

end
