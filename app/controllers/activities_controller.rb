class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
    @responses = @activity.responses.where(user: current_user)
    @unanswered_questions = @activity.questions - @responses.map { |r| r.question}
    @response = Response.new

  end
end
