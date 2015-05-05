RSpec.shared_examples "an API successful operation" do
  # let(:body) { JSON.load(response.body) }
  it "should have a 200 response code" do
    expect(response.response_code).to eq(200)
  end
  # it "should have a success result" do
  #   expect(body["result"]).to eq(DdrAux::Api::Result::SUCCESS)
  # end
end

RSpec.shared_examples "an API error operation" do |message|
  let(:body) { JSON.load(response.body) }
  # it "should have an error result" do
  #   expect(body["result"]).to eq(DdrAux::Api::Result::ERROR)
  # end
  it "should have an error message" do
    expect(body["message"]).to eq(message)
  end
end

RSpec.shared_examples "an API not found response" do
  it "should have a 404 response code" do
    expect(response.response_code).to eq(404)
  end
  it_behaves_like "an API error operation", "The requested resource was not found."
end

RSpec.shared_examples "an API forbidden operation" do
  it "should have a 403 response code" do
    expect(response.response_code).to eq(403)
  end
  it_behaves_like "an API error operation", "Access to the requested resource is denied."
end
