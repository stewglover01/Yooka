class JourneysController < ApplicationController
  def show
    @journeys = current_user.journeys
    @journey = @journeys.last
    @journey_lessons = @journey.journey_lessons
  end
end
