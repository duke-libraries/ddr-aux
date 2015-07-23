require 'rails_helper'
require 'json/ld'

RSpec.describe "ruby-rdf/json-ld integration", type: :feature do

  describe "show view result" do
    before { @org = FactoryGirl.create(:organization) }
    it "should create an API object" do
      visit organization_url(@org)
      input = JSON.parse page.body
      doc = JSON::LD::API.new(input, nil)
      expect(doc.value["name"]).to eq(@org.name)
      expect(doc.context.term_definitions.keys)
        .to include("name", "short_name", "phone", "email", "url", "ask")
      resource = JSON::LD::Resource.new(input)
      expect(resource.name).to eq(@org.name)
    end
  end

end
