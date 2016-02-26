require "rails_helper"

RSpec.describe User, type: :model do

  describe "instance methods" do
    subject { FactoryGirl.create(:user) }

    its(:api_key) { is_expected.to be_nil }
    its(:password) { is_expected.to be_present }

    describe "#set_generated_api_key" do
      it "auto-generates and persists the api key" do
        subject.set_generated_api_key
        expect(subject.api_key).to be_present
      end
    end
  end

  describe "class methods" do
    describe ".api_authenticate" do
      let(:user) { FactoryGirl.create(:user, :api_key) }
      subject { described_class.api_authenticate(user.username, api_key) }
      describe "when the api key is not present" do
        let(:api_key) { nil }
        it { is_expected.to be_nil }
      end
      describe "when the username and api key matches a user" do
        let(:api_key) { user.api_key }
        it { is_expected.to eq(user) }
      end
    end
  end

end
