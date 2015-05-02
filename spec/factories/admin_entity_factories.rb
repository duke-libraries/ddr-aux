FactoryGirl.define do
  factory :admin_entity do
    sequence(:slug) { |n| "slug#{n}" }
    name { |obj| obj.slug.capitalize }
  end
end
