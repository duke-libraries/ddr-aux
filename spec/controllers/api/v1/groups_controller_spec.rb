require "rails_helper"

module Api::V1
  RSpec.describe GroupsController do

    let(:user) { FactoryGirl.create(:user, :api_key) }

    before do
      allow(controller).to receive(:api_authenticate_with_http_basic) { user }
    end

    let(:mock_grouper) { double(groups: nil) }

    describe "#index" do
      before do
        allow(controller).to receive(:grouper) { mock_grouper }
      end
      it "searches Grouper" do
        expect(mock_grouper).to receive(:groups).with(filter: "com:example:", subject: "bob")
        get :index, filter: "com:example:", subject: "bob"
      end
    end

  end
end
