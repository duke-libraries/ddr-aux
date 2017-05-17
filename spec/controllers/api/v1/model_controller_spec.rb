require "rails_helper"

module Api::V1
  RSpec.describe ModelController do

    models = %w( admin_sets contacts languages licenses )

    before(:all) { AdminSet.create(code: "foo", title: "Foo") }

    after(:all) { AdminSet.destroy_all }

    models.each do |model|

      describe "#index" do
        describe model do
          it "succeeds" do
            get :index, model: model
            expect(response.response_code).to eq(200)
            expect(response.content_type).to eq("application/json")
          end
        end
      end

      describe "#show" do
        describe model do
          it "succeeds when found" do
            get :show, model: model, id: 1
            expect(response.response_code).to eq(200)
            expect(response.content_type).to eq("application/json")
            result = JSON.parse(response.body)
            expect(result).to be_a(Hash)
            expect(result["id"]).to eq(1)
          end
          it "returns an error response when not found" do
            get :show, model: model, id: "foo"
            expect(response.response_code).to eq(404)
            expect(response.content_type).to eq("application/json")
          end
        end
      end
    end

  end
end
