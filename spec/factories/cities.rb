FactoryBot.define do
  factory :state do
    name { Faker::Address.state } # Use Faker gem to generate a random state name
  end
end

FactoryBot.define do
  factory :city do
    name { Faker::Address.city }
    state
  end
end
