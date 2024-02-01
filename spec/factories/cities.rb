FactoryBot.define do
  factory :state do
    name { 'Paraná' }
  end
end

FactoryBot.define do
  factory :city do
    name { 'Colombo' }
    states_id { 1 }
  end
end
