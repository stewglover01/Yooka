class JourneysController < ApplicationController
  before_action :curved_blue_banner

  def show
    @journeys = current_user.journeys
    @journey = @journeys.last
    @journey_lessons = @journey.journey_lessons.sort_by { |journey_lesson| journey_lesson.id}
    @journey_lessons2 = @journey.journey_lessons
    @completed_lessons = @journey_lessons2.where(complete: true)
    @journey_progress = ((@completed_lessons.length.to_f / @journey_lessons.length)*100).to_i
  end
end
