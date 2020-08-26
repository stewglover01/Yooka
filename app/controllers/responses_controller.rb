class ResponsesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @response = Response.new(response_params)
    @response.question = @question
    @activity = @question.activity
    @unanswered_questions = @activity.questions.select {|q| q.response.nil?}
    if @response.save
      redirect_to lesson_activity_path(@activity.lesson, @activity)
    else
      render 'activities/show'
    end
  end

  private

  def response_params
    params.require(:response).permit(:content)
  end
end
