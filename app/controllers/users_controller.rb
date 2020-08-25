class UsersController < ApplicationController
  def home
    @journeys = current_user.journeys
    @daily_mood = DailyMood.find_by(:created_at.to_s == Date.today.to_s)
    unless @daily_mood
      redirect_to '/checkin'
    end
    
  end

  def show
  end

  def social
    @leaderboard = User.order('xp DESC').limit(10)
  end

  def tools
  end

  def support
  end
end
