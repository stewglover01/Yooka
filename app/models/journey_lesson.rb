class JourneyLesson < ApplicationRecord
  belongs_to :lesson
  belongs_to :journey
end
