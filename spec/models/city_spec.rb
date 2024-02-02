require 'rails_helper'

RSpec.describe City, type: :model do
  before(:each) do
    # @state = State.create!(name: 'Parana')
    @state = FactoryBot.create(:state)
    @cities = FactoryBot.create_list(:city, 3, state_id: @state.id)
  end

  it 'must return an error when trying to create a city withou a name' do
    expect { City.create! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'must not return any error when trying to create a city' do
    # state = State.create!(name: 'Parana')
    city = City.create!(name: 'Colombo', state_id: @state.id)
    expect(city.errors).to be_empty
  end

  it 'must return a collection of cities according to the state_id and search term provided' do
    cities = City.filter({ 'name' => @cities.sample.name, 'state_id' => @state.id })
    expect(cities.count).to eq(1)
  end

  it 'must return a collection of cities according to the state_id provided' do
    cities = City.filter({ 'name' => '', 'state_id' => @state.id })
    expect(cities.count).to eq(3)
  end
  it 'must return a collection of all cities if params are blank' do
    cities = City.filter({ 'name' => '', 'state_id' => '' })
    expect(cities.count).to eq(3)
  end
end
