RSpec.shared_examples "a JSON API operation" do
  it "should have the right content type" do
    expect(response.content_type).to eq("application/json")
  end
end

RSpec.shared_examples "a JSON-LD API operation" do
  it "should have the right content type" do
    expect(response.content_type).to eq("application/ld+json")
  end
end

RSpec.shared_examples "an API successful operation" do
  it "should have a 200 response code" do
    expect(response.response_code).to eq(200)
  end
end

RSpec.shared_examples "an API error operation" do |message|
  it "should have an empty body" do
    expect(response.body.strip).to be_empty
  end
end

RSpec.shared_examples "an API not found response" do
  it "should have a 404 response code" do
    expect(response.response_code).to eq(404)
  end
  it_behaves_like "an API error operation"
end

RSpec.shared_examples "an API forbidden operation" do
  it "should have a 403 response code" do
    expect(response.response_code).to eq(403)
  end
  it_behaves_like "an API error operation"
end
