require "rails_helper"

RSpec.describe "API V1 duracloud routing" do

  it "routes POST /api/duracloud/manifest_entries/select" do
    expect(post: "/api/duracloud/manifest_entries/select")
      .to route_to(controller: "api/v1/duracloud/manifest_entries", action: "select", format: "json")
  end

end
