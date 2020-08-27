class JourneysController < ApplicationController
  def show
    @journey = Journey.find(params[:id])
    @journey_lessons = @journey.journey_lessons.sort_by { |journey_lesson| journey_lesson.id}
  end
end
