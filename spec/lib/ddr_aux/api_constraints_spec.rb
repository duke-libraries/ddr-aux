require "rails_helper"
require "ddr_aux/api_constraints"

module DdrAux
  RSpec.describe ApiConstraints do

    describe "#matches?" do
      describe "when initialized with default: true" do
        subject { described_class.new(version: 1, default: true) }
        it "should be true" do
          request = double("request")
          expect(subject.matches?(request)).to be true
        end
      end
      describe "when initialized with default: false" do
        subject { described_class.new(version: 1, default: false) }
        describe "and the request Accept header is set to the right version" do
          it "should be true" do
            request = double(headers: {"Accept" => "application/vnd.ddr-aux.v1"})
            expect(subject.matches?(request)).to be true
          end
        end
        describe "and the request Accept header is set to a different version" do
          it "should be false" do
            request = double(headers: {"Accept" => "application/vnd.ddr-aux.v2"})
            expect(subject.matches?(request)).to be false
          end
        end
      end
    end

  end
end
