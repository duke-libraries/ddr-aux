require 'rails_helper'

module Api
  RSpec.describe ModelController, type: :controller do

    describe "#iri_for" do
      shared_examples "API model url_for params" do
        it "should call `url_for` with relative :id, :controller, and :action params" do
          expect(subject).to receive(:url_for).with(hash_including(id: obj, controller: subject.controller_name, action: :show))
          subject.send(:iri_for, obj)
        end
      end
      let(:obj) { double(to_param: "foo") }
      describe "when `ddr_aux.base_iri` config var is not set" do
        before do
          allow(Rails.configuration.ddr_aux).to receive(:base_iri) { nil }
        end
        include_examples "API model url_for params"
      end
      describe "when `ddr_aux.base_iri` config var is set" do
        describe "when using the default port" do
          before do
            allow(Rails.configuration.ddr_aux).to receive(:base_iri) { "http://example.com" }
          end
          include_examples "API model url_for params"
          it "should call url_for with :host and :protocol options" do
            expect(subject).to receive(:url_for).with(hash_including(host: "example.com", protocol: "http"))
            subject.send(:iri_for, obj)
          end
        end
        describe "when using a non-default port" do
          before do
            allow(Rails.configuration.ddr_aux).to receive(:base_iri) { "http://example.com:8080" }
          end
          include_examples "API model url_for params"
          it "should call url_for with :host, :protocol, and :port options" do
            expect(subject).to receive(:url_for).with(hash_including(host: "example.com", protocol: "http", port: 8080))
            subject.send(:iri_for, obj)
          end
        end
      end
    end

  end
end
