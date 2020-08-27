class Activity < ApplicationRecord
  belongs_to :lesson
  has_many :questions
  has_many :responses, through: :questions
end
