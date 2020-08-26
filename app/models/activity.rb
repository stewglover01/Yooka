class Activity < ApplicationRecord
  belongs_to :lesson
  has_many :questions
end
