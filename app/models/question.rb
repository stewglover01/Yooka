class Question < ApplicationRecord
  belongs_to :activity, optional: true
  belongs_to :habit, optional: true
  has_many :responses
  validates :question, presence: true
end
