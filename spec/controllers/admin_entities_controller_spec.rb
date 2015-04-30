require "rails_helper"

RSpec.describe AdminEntitiesController, type: :controller do
  describe "#slug" do
    before { allow(AdminEntity).to receive(:find_by).with({slug: "foo"}) { AdminEntity.new(slug: "foo", name: "Foo") } }
    it "should return a JSON hash of attributes for the admin entity" do
      get :slug, slug: "foo", format: "json"
      entity = JSON.load(response.body)
      expect(entity["slug"]).to eq("foo")
      expect(entity["name"]).to eq("Foo")
    end
  end
  describe "#slugs" do
    before { allow(AdminEntity).to receive(:pluck).with(:slug, :name) { [["foo", "Foo"], ["bar", "Bar"]] } }
    it "should return a JSON hash of admin entities keyed by slug" do
      get :slugs, format: "json"
      expect(JSON.load(response.body)).to eq({"foo"=>"Foo", "bar"=>"Bar"})
    end
  end
end
