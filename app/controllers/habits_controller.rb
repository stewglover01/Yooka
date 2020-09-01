class HabitsController < ApplicationController
before_action :no_banner
    def show
     @habit = Habit.find(params[:id])
     @response = Response.new
     @habit_questions = @habit.questions




    @responses = @habit.responses.where(user: current_user)
    @unanswered_questions = @habit.questions - @responses.map { |r| r.question}
    @answered_questions = @responses.map { |r| r.question}
    @all_questions = @habit.questions
    @response = Response.new
    @badgesearned = []
    @journeys = current_user.journeys
    @habit_progress = ((@answered_questions.length.to_f / @all_questions.length)*100).to_i

    # assigning XP and badges
    if @unanswered_questions.empty?
      @journey_habit = JourneyHabit.new(journey: current_user.journeys.last, habit: @habit)
      @journey_habit.save
      current_user.xp += @habit.xp
      current_user.save
    end
    if current_user.xp > 10
      @badge = Badge.last
      badgeuser = BadgeUser.new(user: current_user, badge: @badge)
      badgeuser.save
      @badgesearned << badgeuser
    end

    end

end
