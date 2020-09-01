class ActivitiesController < ApplicationController
  before_action :no_banner

  def show
    @activity = Activity.find(params[:id])
    @activities = @activity.lesson.activities
    @responses = @activity.responses.where(user: current_user)
    @lesson = @activity.lesson
    @unanswered_questions = @activity.questions - @responses.map { |r| r.question}
    @answered_questions = @responses.map { |r| r.question}
    @all_questions = @activity.questions
    @response = Response.new
    @badgesearned = []
    @journeys = current_user.journeys
    @activity_progress = ((@answered_questions.length.to_f / @all_questions.length)*100).to_i

    # assigning XP and badges
    if @unanswered_questions.empty?
      current_user.xp += @activity.xp
      current_user.save
    end
    if current_user.xp >= 15
      @badge = Badge.find_by(name:"hot streak")
      badgeuser = BadgeUser.new(user: current_user, badge: @badge)
      badgeuser.save
      if badgeuser.save
      @badgesearned << badgeuser
      end
    end
    if current_user.xp >= 65
      @badge = Badge.find_by(name:"sleep master")
      badgeuser = BadgeUser.new(user: current_user, badge: @badge)
      badgeuser.save
      if badgeuser.save
        @badgesearned << badgeuser
      end
    end
    if current_user.xp >= 115
      @badge = Badge.find_by(name:"mindfulness guru")
      badgeuser = BadgeUser.new(user: current_user, badge: @badge)
      badgeuser.save
      if badgeuser.save
        @badgesearned << badgeuser
      end
    end
    if current_user.xp >= 165
      @badge = Badge.find_by(name:"sleep master")
      badgeuser = BadgeUser.new(user: current_user, badge: @badge)
      badgeuser.save
      if badgeuser.save
        @badgesearned << badgeuser
      end
    end
    if current_user.xp >= 215
      @badge = Badge.find_by(name:"stress buster")
      badgeuser = BadgeUser.new(user: current_user, badge: @badge)
      badgeuser.save
      if badgeuser.save
        @badgesearned << badgeuser
      end
    end
    if current_user.xp >= 265
      @badge = Badge.find_by(name:"mentor")
      badgeuser = BadgeUser.new(user: current_user, badge: @badge)
      badgeuser.save
      if badgeuser.save
        @badgesearned << badgeuser
      end
    end









    # calculating quiz score
    # ifany of the activities questions have a correct answer do this
    if @activity.questions.select {|question| question.correct_answer.present? }.count > 0
      #declare a variable called quiz_score
      @quiz_score = 0
      #declare a varible called number_of_quiz_questions
      @number_of_quiz_questions = @all_questions.count
      # get the responses associated with the question in this activity and put them in an array
        @responses.each do |response|
        # iterate over that array and if a response is marked as correct add 1 to quiz score and 1 to the number of quiz questions
        if response.correct == true
          @quiz_score += 1
        # if response is inccorect just add one to number of quiz questions
        elsif response.correct == false
          # do nothing
        end
      end
    end


    

  end
end
