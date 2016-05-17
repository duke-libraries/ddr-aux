require "rails_helper"

module Api::V1
  RSpec.describe PeopleController do

    let(:user) { FactoryGirl.create(:user, :api_key) }

    before do
      allow(controller).to receive(:api_authenticate_with_http_basic) { user }
    end

    let(:mock_ldap) { double(find: nil) }

    describe "#find" do
      before do
        allow(controller).to receive(:ldap) { mock_ldap }
      end
      it "searches LDAP" do
        expect(mock_ldap).to receive(:find).with("eduPersonPrincipalName", "foobar@example.com") { nil }
        get :find, key: "eduPersonPrincipalName", value: "foobar@example.com"
      end
    end

  end
end
