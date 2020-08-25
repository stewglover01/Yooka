class JourneysController < ApplicationController
  def show
    @journey = Journey.find(params[:id])
    @journey_lessons = @journey.journey_lessons
  end
end
