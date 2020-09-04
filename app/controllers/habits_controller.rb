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
    if @answered_questions.length > 0
    @habit_progress = ((@answered_questions.length / @all_questions.length)*100).to_i
    end
    # @journey_progress = ((@completed_lessons.length.to_f / @journey_lessons.length)*100).to_i
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

    #streak logic

    @journey_habits = JourneyHabit.where(journey: @journeys.last).order('created_at DESC')
    
    unless current_user.teacher
      counter = 0
      last_habit = nil
      if @journey_habits.length > 0 && @journey_habits.first.created_at.strftime("%j").to_i == Date.today.strftime("%j").to_i
        @journey_habits.each do |journey_habit|
            if last_habit == nil
              last_habit = journey_habit
            elsif
              (last_habit.created_at.strftime("%j").to_i - journey_habit.created_at.strftime("%j").to_i) == 1
              counter += 1
              last_habit = journey_habit
            else
              break
            end
          end
          counter += 1
      end
      @streak = counter
    end


    end

end
