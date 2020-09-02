class UsersController < ApplicationController
  before_action :green_banner, only: :social
  before_action :cream_banner, only: :tools

  def home
    @short_leaderboard = User.where(teacher:false).order('xp DESC').limit(4)
    if current_user.teacher
      redirect_to '/users/teacherhome'
    end
      @journeys = current_user.journeys
      if @journeys.count > 0
        @journey = @journeys.last
        @journey_lessons = @journey.journey_lessons
        @completed_lessons = @journey_lessons.where(complete: true)
        @journey_progress = ((@completed_lessons.length.to_f / @journey_lessons.length)*100).to_i
      end
      @user_badges = BadgeUser.where(user: current_user)
      @journey_habits = JourneyHabit.where(journey: @journeys.last).order('created_at DESC')
      @daily_mood = DailyMood.find_by(created_at: Date.today.beginning_of_day..Date.today.end_of_day, user: current_user)
      unless @daily_mood  || current_user.teacher
        redirect_to '/checkin'
      end


    # streak logic
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

  def show
  end

  def social
    @leaderboard = User.where(teacher:false).order('xp DESC').limit(10)
    @journeys = current_user.journeys
    @students = User.where(teacher: false, school_class:current_user.school_class)
    @badge_activity = BadgeUser.where(@students.include? :user)
    @habit_activity = JourneyHabit.where(@students.include? :user)
    @recent_activity = (@badge_activity+@habit_activity).sort_by { |activity| activity.created_at }.reverse.first(10)

  end

  def tools
    @tools = Tool.all
    @journeys = current_user.journeys
  end

  def support
    @journeys = current_user.journeys
  end

  def teacherhome
    @students = User.where(teacher: false, school_class:current_user.school_class)
    @badge_activity = BadgeUser.where(@students.include? :user)
    @mood_activity = DailyMood.where(@students.include? :user)
    @habit_activity = JourneyHabit.where(@students.include? :user)
    @recent_activity = (@badge_activity+@mood_activity+@habit_activity).sort_by { |activity| activity.created_at }.reverse.first(10)
    @habit_data = JourneyHabit.totals_by_user(current_user)
    @negative_moods = %w(🙁 😡 😰 😯 🤕)
  end
private

end
