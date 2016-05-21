require "rails_helper"

RSpec.describe "API V1 duracloud routing" do

  it "routes GET /api/duracloud/manifest_entries" do
    expect(get: "/api/duracloud/manifest_entries?space_id=foo&content_id=bar")
      .to route_to(controller: "api/v1/duracloud/manifest_entries", action: "index", space_id: "foo", content_id: "bar", format: "json")
  end

end
