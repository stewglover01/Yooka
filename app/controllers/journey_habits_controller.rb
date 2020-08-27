class JourneyHabitsController < ApplicationController
  def create
    @habit = Habit.create(name: "Sleep")
    @journey_habit = JourneyHabit.new(journey: current_user.journeys.last, habit: @habit)
    @journey_habit.save
    redirect_to users_home_path
  end
end
