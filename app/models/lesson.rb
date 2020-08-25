class Lesson < ApplicationRecord
  has_many :journey_lessons
  has_many :activites
  validates :name, :description, presence: true
end
