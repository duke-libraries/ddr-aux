require 'rails_helper'
require 'cancan/matchers'

module Api
  RSpec.describe Ability, type: :model do

    let!(:user_context) { FactoryGirl.build(:user_context) }
    subject { described_class.new(user_context) }

    models = [ AdminEntity ]
    models.each do |model|
      describe "when the request is local" do
        before { allow(user_context.request).to receive(:local?) { true } }
        it { is_expected.to be_able_to(:show, model.new) }
        it { is_expected.to be_able_to(:index, model) }
      end
    end

  end
end
