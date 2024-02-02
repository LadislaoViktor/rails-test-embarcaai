# frozen_string_literal: true

# Model for State
class State < ApplicationRecord
  has_many :city
end
