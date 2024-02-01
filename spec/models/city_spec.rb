require 'rails_helper'

RSpec.describe City, type: :model do
  it 'must return an error when trying to create a city withou a state' do
    expect{ City.create!}.to raise_error(ActiveRecord::NotNullViolation)
  end

  it 'must return an error when trying to create a city withou a state' do
    state = State.create!(name:"Parana")
    city = City.create!(name:'Colombo',states_id: state.id)
    expect(city.errors).to be_empty
  end

  it 'must return a collection of cities according to the states_id and search term provided' do
    cities = City.filter({"name"=>"olo", "states_id"=>"1"})
    expect(cities.count).to eq(3)
  end

  it 'must return a collection of cities according to the states_id provided' do
    cities = City.filter({"name"=>"", "states_id"=>"2"})
    expect(cities.count).to eq(295)
  end
end
