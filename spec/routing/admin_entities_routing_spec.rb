require "rails_helper"

RSpec.describe "AdminEntity routing", type: :routing do
  it "should have a route that finds the record by slug and returns JSON" do
    expect(get: '/admin_entities/foobar.json').to route_to(controller: "admin_entities", action: "show", slug: "foobar", format: "json")
  end
end
