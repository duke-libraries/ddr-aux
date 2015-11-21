require "rails_helper"

module Api::V1
  RSpec.describe ContactsController do

    describe "#index" do
      it "returns the list of all contacts" do
        get :index
        results = JSON.parse(response.body)
        expect(results).to be_present
        expect(results).to be_a(Array)
      end
    end

    describe "#show" do
      it "returns a contact" do
        get :show, id: 1
        expect(response.response_code).to eq(200)
        expect(response.content_type).to eq("application/json")
        result = JSON.parse(response.body)
        expect(result).to be_a(Hash)
        expect(result["id"]).to eq(1)
      end
      it "return an error response when not found" do
        get :show, id: "foo"
        expect(response.response_code).to eq(404)
        expect(response.content_type).to eq("application/json")
      end
    end

    describe "#find" do
      it "returns a contact" do
        get :find, slug: "libraries"
        expect(response.response_code).to eq(200)
        expect(response.content_type).to eq("application/json")
        result = JSON.parse(response.body)
        expect(result).to be_a(Hash)
        expect(result["slug"]).to eq("libraries")
      end
      it "return an error response when not found" do
        get :find, slug: "foo"
        expect(response.response_code).to eq(404)
        expect(response.content_type).to eq("application/json")
      end
    end

  end
end
