require "rails_helper"

RSpec.describe ApiAccount do

  it "auto-generates the secret key" do
    account = described_class.create(access_id: "bob@example.com")
    expect(account.secret_key).to be_present
  end

end
