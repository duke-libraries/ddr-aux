require 'rails_helper'
require 'cancan/matchers'

module Api
  RSpec.describe Ability, type: :model do

    let!(:user) { FactoryGirl.build(:user) }
    subject { described_class.new(user) }

    models = [ Organization ]
    models.each do |model|
      it { is_expected.to be_able_to(:show, model.new) }
      it { is_expected.to be_able_to(:index, model) }
    end

  end
end
