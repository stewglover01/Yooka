class JourneysController < ApplicationController
  def show
    @journey_lessons = @journey.journey_lessons.sort_by { |journey_lesson| journey_lesson.id}
    @journeys = current_user.journeys
    @journey = @journeys.last
    @completed_lessons = @journey_lessons.where(complete: true)
    @journey_progress = ((@completed_lessons.length.to_f / @journey_lessons.length)*100).to_i
  end
end
