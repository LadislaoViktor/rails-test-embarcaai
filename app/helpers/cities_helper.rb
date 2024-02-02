# frozen_string_literal: true

# A helper for City Views
module CitiesHelper
  def states
    State.all if State.count.positive?
  end
end
