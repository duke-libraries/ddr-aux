require 'rails_helper'
require 'linkeddata'

RSpec.describe "Integration with RDF.rb", type: :feature do

  describe "list view results" do
    before { @admin_entities = FactoryGirl.create_list(:admin_entity, 3) }
    it "should read the list" do
      visit admin_entities_url
      data = StringIO.new(page.body)
      RDF::Reader.for(:jsonld).new(data) do |reader|
        expect(reader.subjects.to_a).to eq(@admin_entities.map { |obj| RDF::URI(admin_entity_url(obj))})
      end
    end
  end

  describe "show view result" do
    before { @admin_entity = FactoryGirl.create(:admin_entity) }
    it "should read the record" do
      visit admin_entity_url(@admin_entity)
      data = StringIO.new(page.body)
      RDF::Reader.for(:jsonld).new(data) do |reader|
        expect(reader.subjects.first).to eq(RDF::URI(admin_entity_url(@admin_entity)))
      end
    end
  end

end
