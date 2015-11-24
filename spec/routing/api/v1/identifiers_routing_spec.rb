require "rails_helper"

RSpec.describe "API v1 identifiers routing", type: :routing do

  it "routes GET /api/identifiers" do
    expect(get: "/api/identifiers")
      .to route_to(controller: "api/v1/identifiers", action: "index", format: "json")
  end

  it "routes POST /api/identifiers" do
    expect(post: "/api/identifiers")
      .to route_to(controller: "api/v1/identifiers", action: "create", format: "json")
  end

  it "routes GET /api/identifiers/ark:/99999/fk4zzzzz" do
    expect(get: "/api/identifiers/ark:/99999/fk4zzzzz")
      .to route_to(controller: "api/v1/identifiers", action: "show", format: "json",
                   id: "ark:/99999/fk4zzzzz")
  end

  it "routes PUT /api/identifiers/ark:/99999/fk4zzzzz" do
    expect(put: "/api/identifiers/ark:/99999/fk4zzzzz")
      .to route_to(controller: "api/v1/identifiers", action: "update", format: "json",
                   id: "ark:/99999/fk4zzzzz")
  end

  it "routes DELETE /api/identifiers/ark:/99999/fk4zzzzz" do
    expect(delete: "/api/identifiers/ark:/99999/fk4zzzzz")
      .to route_to(controller: "api/v1/identifiers", action: "destroy", format: "json",
                   id: "ark:/99999/fk4zzzzz")
  end

end
