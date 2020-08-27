class JourneyHabit < ApplicationRecord
  belongs_to :journey
  belongs_to :habit
  validates_uniqueness_of :habit, conditions: -> { where("DATE(created_at) = ?", Date.today) }
end
