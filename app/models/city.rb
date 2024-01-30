class City < ApplicationRecord
  belongs_to :state, optional: true
  self.per_page = 10

  def states
    @states = State.all
  end
end
