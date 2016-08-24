require "rails_helper"

RSpec.describe "API V1 duracloud routing" do

  it "routes GET /api/duracloud/manifest_entries" do
    expect(get: "/api/duracloud/manifest_entries/fcrepo3.json?space_id=foo&object_uri=info%3Afedora%2Fduke%3A1")
      .to route_to(controller: "api/v1/duracloud/manifest_entries", action: "fcrepo3", space_id: "foo", object_uri: "info:fedora/duke:1", format: "json")
  end

end
