class UsersController < ApplicationController
  def home
    @journeys = current_user.journeys
    @user_badges = BadgeUser.where(user: current_user)
    @journey_habits = JourneyHabit.where(journey: @journeys.last).order('created_at DESC')
    @daily_mood = DailyMood.find_by(created_at: Date.today.beginning_of_day..Date.today.end_of_day, user: current_user)
    unless @daily_mood
      redirect_to '/checkin'
    end

    # streak logic
    counter = 0
    last_habit = nil
    @journey_habits.each do |journey_habit|
      if last_habit == nil
        counter += 0
        last_habit = journey_habit
      elsif
        (last_habit.created_at.strftime("%j").to_i - journey_habit.created_at.strftime("%j").to_i) == 1
        counter += 1
        last_habit = journey_habit
      else break
      end
    end
    @streak = counter

  end

  def show
  end

  def social
    @leaderboard = User.order('xp DESC').limit(10)
    @journeys = current_user.journeys
  end

  def tools
    @tools = Tool.all
    @journeys = current_user.journeys
  end

  def support
    @journeys = current_user.journeys
  end

private


end
