
class Response < ApplicationRecord
  belongs_to :question
  validates :content, presence: true
  belongs_to :user
  
  
end
