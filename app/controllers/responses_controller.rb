class ResponsesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @response = Response.new(response_params)
    @response.question = @question
    @response.user = current_user
    @activity = @question.activity
    @responses = @activity.responses.where(user: current_user)
    @unanswered_questions = @activity.questions - @responses.map { |r| r.question}
    if @response.save && @unanswered_questions.count == 0
      raise
      redirect_to lesson_activity_path(@activity.lesson, @activity)
    elsif @response.save
      redirect_to lesson_activity_path(@activity.lesson, @activity)
    else
      render 'activities/show'
    end


    # checking if answer correct
    # check if the content of the response is equal to the correct answer of they related question
    if @question.correct_answer.present?
      if @response.content == @question.correct_answer
      # if it is then mark respons as correct
        @response.correct = true
        @response.save!
      #if it isnt then mark response and incorrect
      else
        @response.correct = false
        @response.save!
      end
    end
  end

  private

  def response_params
    params.require(:response).permit(:content)
  end
end