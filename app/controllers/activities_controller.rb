class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
    @unanswered_questions = @activity.questions.select {|q| q.response.nil?}
    @response = Response.new

  end
end
