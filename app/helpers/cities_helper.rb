module CitiesHelper
  def states
    State.all if State.count.positive?
  end
end
