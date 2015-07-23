FactoryGirl.define do
  factory :organization do
    sequence(:name) { |n| "Organization #{n}" }
    short_name { |org| org.name.sub("Organization", "Org") }
    email { |org| "#{org.name.sub(' ', '-')}@example.com" }
    url { |org| "http://www.example.com/orgs/#{org.name.sub(' ', '-')}" }
    phone { "(919) 555-1212" }
  end
end
