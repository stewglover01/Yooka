class JourneyHabit < ApplicationRecord
  belongs_to :journey
  belongs_to :habit
  has_many :questions, through: :habits
  validates_uniqueness_of :habit, conditions: -> { where("DATE(created_at) = ?", Date.today) }
  def self.totals_by_user(current_user)
    @students = User.where(teacher: false, school_class:current_user.school_class)
    @journeyhabits = JourneyHabit.where(@students.include? :user)
    @students.map do |student| 
      [
        student.first_name,
        student.journeys.last.journey_habits.count
      ]
    end
  end
end
