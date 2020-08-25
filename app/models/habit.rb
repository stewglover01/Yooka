class Habit < ApplicationRecord
    has_many :questions
    has_many :journey_habits
end
