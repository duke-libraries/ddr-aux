require "rails_helper"

RSpec.describe "API V1 groups routing" do

  it "routes GET /api/groups" do
    expect(get: "/api/groups?filter=com:example:&subject=bob")
      .to route_to(controller: "api/v1/groups", action: "index", filter: "com:example:", subject: "bob", format: "json")
  end

end
