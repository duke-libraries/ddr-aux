FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user#{n}" }

    trait :api_key do
      api_key { User.generate_api_key }
    end
  end
end
