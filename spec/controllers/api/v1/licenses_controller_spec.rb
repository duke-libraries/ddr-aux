require "rails_helper"

module Api::V1
  RSpec.describe LicensesController do

    describe "#index" do
      it "returns the list of all licenses" do
        get :index
        results = JSON.parse(response.body)
        expect(results).to be_present
        expect(results).to be_a(Array)
      end
    end

    describe "#show" do
      it "returns a license" do
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
      it "returns a license" do
        get :find, url: "https://creativecommons.org/publicdomain/zero/1.0/"
        expect(response.response_code).to eq(200)
        expect(response.content_type).to eq("application/json")
        result = JSON.parse(response.body)
        expect(result).to be_a(Hash)
        expect(result["url"]).to eq("https://creativecommons.org/publicdomain/zero/1.0/")
      end
      it "return an error response when not found" do
        get :find, url: "foo"
        expect(response.response_code).to eq(404)
        expect(response.content_type).to eq("application/json")
      end
    end

  end
end
