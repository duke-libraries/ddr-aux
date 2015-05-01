require "rails_helper"

RSpec.describe AdminEntity, type: :model do
  subject { described_class.new(slug: "foo", name: "Foo-tastic", short_name: "Foo") }
  its(:to_param) { should eq("foo") }
end
