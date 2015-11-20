require "rails_helper"

RSpec.describe "API V1 people routing" do
  it "routes /api/people/find" do
    expect(get: "/api/people/find?key=uid&value=foobar")
      .to route_to(controller: "api/v1/people", action: "find", key: "uid", value: "foobar", format: "json")
  end
end
