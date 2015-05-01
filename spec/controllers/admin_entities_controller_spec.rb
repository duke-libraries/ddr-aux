require "rails_helper"

RSpec.describe AdminEntitiesController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  describe "#slug" do
    let!(:foo) { AdminEntity.new(slug: "foo", name: "Foo") }
    before { allow(AdminEntity).to receive(:find_by).with({slug: "foo"}) { foo } }
    it "should return a JSON hash of attributes for the admin entity" do
      get :show, id: foo, format: "json"
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
