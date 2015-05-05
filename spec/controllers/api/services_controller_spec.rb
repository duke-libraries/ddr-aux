require 'rails_helper'
require 'support/shared_examples_for_api_controllers'

module Api
  RSpec.describe ServicesController, type: :controller do

    describe "#index" do
      before { get :index }
      it_behaves_like "an API successful operation"
      it "should list the API methods" do
        results = JSON.load(response.body)
        expect(results).to include("/api")
      end
    end

  end
end
