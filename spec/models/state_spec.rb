# frozen_string_literal: true

require 'rails_helper'

RSpec.describe State, type: :model do
  before(:each) do
    @state = FactoryBot.create_list(:state,10)
  end

  it 'must return an error when trying to create a state without a name' do
    expect { State.create! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'must create a state successfully' do
    state = State.create!(name: 'Jubilândia')
    expect(state.errors).to be_empty
  end
end
