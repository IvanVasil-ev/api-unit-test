# frozen_string_literal: true

FactoryBot.define do
  factory :news do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence(word_count: 5) }
    tags { Faker::Lorem.word }
    user
  end
end
