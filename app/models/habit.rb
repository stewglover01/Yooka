class Habit < ApplicationRecord
    has_many :questions, dependent: :destroy
    has_many :journey_habits
    has_many :journeys, through: :journey_habits
    has_many :responses, through: :questions

    accepts_nested_attributes_for :responses

end
