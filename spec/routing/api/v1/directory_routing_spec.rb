require "rails_helper"

RSpec.describe "API V1 directory routing" do
  it "routes /api/directory/find" do
    expect(get: "/api/directory/find?user_key=foobar@example.com")
      .to route_to(controller: "api/v1/directory", action: "find", user_key: "foobar@example.com", format: "json")
  end
end
