# frozen_string_literal: true

FactoryBot.define do
  factory :state do
    name { Faker::Address.state } # Use Faker gem to generate a random state name
  end

  factory :city do
    name { Faker::Address.city } # Use Faker gem to generate a random city name
    add_attribute(:states_id) { state }
  end
end
