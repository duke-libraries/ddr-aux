require "rails_helper"

module Api::V1
  RSpec.describe DirectoryController do

    let(:mock_ldap) { double(find: nil) }

    describe "#find" do
      before do
        allow(controller).to receive(:ldap) { mock_ldap }
      end
      it "looks searches LDAP by EPPN" do
        expect(mock_ldap).to receive(:find).with("eduPersonPrincipalName", "foobar@example.com") { nil }
        get :find, user_key: "foobar@example.com"
      end
    end

  end
end
