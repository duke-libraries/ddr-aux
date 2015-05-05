class MockRequest
  def local?; end
end

FactoryGirl.define do
  factory :user_context do
    user
    request MockRequest.new

    initialize_with { new(user, request) }
  end
end
