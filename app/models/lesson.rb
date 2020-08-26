class Lesson < ApplicationRecord
  has_many :journey_lessons
  has_many :activites, dependent: :destroy
  has_many :videos, dependent: :destroy
  validates :name, :description, presence: true
end
