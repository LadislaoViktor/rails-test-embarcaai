# frozen_string_literal: true

# A helper for City Views
module CitiesHelper
  def states
    if State.count.positive?
      State.all
    else
      []
    end 
  end
end
