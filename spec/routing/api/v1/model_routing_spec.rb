require "rails_helper"

RSpec.describe "API v1 model routing", type: :routing do

  it "routes GET /api/:model" do
    expect(get: "/api/admin_sets")
      .to route_to(controller: "api/v1/model", action: "index", model: "admin_sets", format: "json")
    expect(get: "/api/contacts")
      .to route_to(controller: "api/v1/model", action: "index", model: "contacts", format: "json")
    expect(get: "/api/licenses")
      .to route_to(controller: "api/v1/model", action: "index", model: "licenses", format: "json")
    expect(get: "/api/foobar").not_to be_routable
  end

  it "routes GET /api/:model/:id" do
    expect(get: "/api/admin_sets/1")
      .to route_to(controller: "api/v1/model", action: "show", model: "admin_sets", id: "1", format: "json")
    expect(get: "/api/contacts/1")
      .to route_to(controller: "api/v1/model", action: "show", model: "contacts", id: "1", format: "json")
    expect(get: "/api/licenses/1")
      .to route_to(controller: "api/v1/model", action: "show", model: "licenses", id: "1", format: "json")
  end

  it "routes GET /api/:model/find" do
    expect(get: "/api/admin_sets/find?code=dc")
      .to route_to(controller: "api/v1/model", action: "find", model: "admin_sets", code: "dc", format: "json")
    expect(get: "/api/contacts/find?code=dc")
      .to route_to(controller: "api/v1/model", action: "find", model: "contacts", code: "dc", format: "json")
    expect(get: "/api/licenses/find?url=https%3A%2F%2Fcreativecommons.org%2Fpublicdomain%2Fzero%2F1.0%2F")
      .to route_to(controller: "api/v1/model", action: "find", model: "licenses", url: "https://creativecommons.org/publicdomain/zero/1.0/", format: "json")
  end

end
