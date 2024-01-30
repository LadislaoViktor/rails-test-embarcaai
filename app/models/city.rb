class City < ApplicationRecord
  belongs_to :state, optional: true
  after_initialize :states

  def states
    @states = State.all
  end

  def set_state
    @state = State.find(states_id)
  end
end
