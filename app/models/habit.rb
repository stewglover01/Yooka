class Habit < ApplicationRecord
    has_many :questions, dependent: :destroy
    has_many :journey_habits
    has_many :journeys, through: :journey_habits

end
