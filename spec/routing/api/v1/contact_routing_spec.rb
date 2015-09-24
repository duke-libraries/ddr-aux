require "rails_helper"

RSpec.describe "API V1 contact routing", type: :routing do

  it "routes /api/contacts to the api/v1/contacts controller" do
    expect(get: "/api/contacts").to route_to(controller: "api/v1/contacts", action: "index", format: "json")
  end

  it "routes /api/contacts/{id} to the api/v1/contacts controller" do
    expect(get: "/api/contacts/1").to route_to(controller: "api/v1/contacts", action: "show", id: "1", format: "json")
  end

  it "routes /api/contacts/find to the api/v1/contacts controller" do
    expect(get: "/api/contacts/find?code=dc").to route_to(controller: "api/v1/contacts", action: "find", code: "dc", format: "json")
  end

end