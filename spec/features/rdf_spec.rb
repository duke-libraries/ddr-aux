require 'rails_helper'
require 'linkeddata'

RSpec.describe "Integration with RDF.rb", type: :feature do

  describe "list view results" do
    before { @orgs = FactoryGirl.create_list(:organization, 3) }
    it "should read the list" do
      visit organizations_url
      data = StringIO.new(page.body)
      RDF::Reader.for(:jsonld).new(data) do |reader|
        expect(reader.subjects.to_a).to eq( @orgs.map { |org| RDF::URI(organization_url(org)) } )
      end
    end
  end

  describe "show view result" do
    before { @org = FactoryGirl.create(:organization) }
    it "should read the record" do
      visit organization_url(@org)
      data = StringIO.new(page.body)
      RDF::Reader.for(:jsonld).new(data) do |reader|
        expect(reader.subjects.first).to eq(RDF::URI(organization_url(@org)))
      end
    end
  end

end
