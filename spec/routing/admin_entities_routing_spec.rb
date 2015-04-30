require "rails_helper"

RSpec.describe "AdminEntity routing", type: :routing do
  it "should have a slug route" do
    @route = {controller: "admin_entities", action: "slug", slug: "foobar", format: "json"}
    expect(get: '/admin_entities/foobar.json').to route_to(@route)
    expect(get: '/admin_entities/foobar').to route_to(@route)
  end
  it "should have an index route" do
    @route = {controller: "admin_entities", action: "index", format: "json"}
    expect(get: '/admin_entities.json').to route_to(@route)
    expect(get: '/admin_entities').to route_to(@route)
  end
  it "should have a slugs route" do
    @route = {controller: "admin_entities", action: "slugs", format: "json"}
    expect(get: '/admin_entities/slugs').to route_to(@route)
    expect(get: '/admin_entities/slugs.json').to route_to(@route)
  end
end
