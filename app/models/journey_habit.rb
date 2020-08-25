class JourneyHabit < ApplicationRecord
  belongs_to :journey
  belongs_to :habit
end
