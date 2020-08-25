class Habit < ApplicationRecord
  has_many :journeys through: :journey_habits
end
