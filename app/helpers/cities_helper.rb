# frozen_string_literal: true

# A helper for City Views
module CitiesHelper
  def states
    State.count.positive? ? State.all : []
  end
end
