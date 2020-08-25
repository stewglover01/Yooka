class Journey < ApplicationRecord
  belongs_to :user
  has_many :journey_lessons
  has_many :lessons, through: :journey_lessons
  validates :name, presence: true
end
