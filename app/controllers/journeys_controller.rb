class JourneysController < ApplicationController
  before_action :curved_blue_banner


  def show
    @journeys = current_user.journeys
    @journey = @journeys.last
    @journey_lessons = @journey.journey_lessons.sort_by { |journey_lesson| journey_lesson.id}
    @journey_lessons2 = @journey.journey_lessons
    @completed_lessons = @journey_lessons2.where(complete: true)
    @journey_progress = ((@completed_lessons.length.to_f / @journey_lessons.length)*100).to_i


    # @last_lesson_complete = @journey_lessons.find { |journey_lesson| journey_lesson @unanswered_questions.count == 0}

    # Marking as complete logic
    @complete_journey_lessons = []
    @journey_lessons.each do |journey_lesson|
      @user_responses = []
      journey_lesson.lesson.activities.each do |activity|
          @user_responses << activity.responses.where(user: current_user)

      end
      @all_lesson_questions = [] 
      journey_lesson.lesson.activities.each do |activity|
        @all_lesson_questions << activity.questions
      end
      @unanswered_questions = @all_lesson_questions.flatten - @user_responses.flatten.map { |response| response.question }
      if @unanswered_questions.count == 0 && journey_lesson.video_watched == true
        @complete_journey_lessons << journey_lesson 
        journey_lesson.complete = true
        journey_lesson.save!
      end
    end
       
    if @complete_journey_lessons.empty?
      @last_lesson_completed = nil
    else
     @last_lesson_completed = @complete_journey_lessons.flatten.last.lesson
    end

    if @last_lesson_completed == nil
      @next_lesson_to_complete = @journey_lessons.first.lesson
    else
      @next_lesson_to_complete = Lesson.find(@last_lesson_completed.id + 1)
    end
    
  end
end
