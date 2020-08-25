class Lesson < ApplicationRecord
  has_many :journey_lessons
  validates :name, :description, presence: true
end
