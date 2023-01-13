# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.unique.email }
    password { Faker::Alphanumeric.alpha(number: 6) }
  end

  trait :with_5_news do
    after(:create) do |user|
      create_list(:news, 5, user: user)
    end
  end
end
