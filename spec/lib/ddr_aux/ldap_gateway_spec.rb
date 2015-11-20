require "spec_helper"
require "ddr_aux/ldap_gateway"

module DdrAux
  RSpec.describe LdapGateway do

    subject { described_class.new(host: "http://example.com", port: 389, base: "dc=example,dc=com") }

    let(:entry) { Net::LDAP::Entry.new("dn") }
    let(:error_result) { double(error_message: "Oops!") }
    let(:params) { double }

    describe "#search" do
      describe "when there is an LDAP error" do
        before do
          allow(subject.ldap).to receive(:search).with(params) { nil }
          allow(subject.ldap).to receive(:get_operation_result) { error_result }
        end
        it "raises a SearchError exception" do
          expect { subject.search(params) }.to raise_error(LdapGateway::SearchError)
        end
      end
      describe "when no results are found" do
        before do
          allow(subject.ldap).to receive(:search).with(params) { [] }
        end
        it "raises a NotFound exception" do
          expect { subject.search(params) }.to raise_error(LdapGateway::NotFound)
        end
      end
      describe "when a result is found" do
        before do
          allow(subject.ldap).to receive(:search).with(params) { [entry] }
        end
        it "returns the wrapped LDAP entry" do
          expect(subject.search(params).dn).to eq(LdapGateway::Result.new(entry).dn)
        end
      end
    end

  end
end
