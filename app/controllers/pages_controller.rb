class PagesController < ApplicationController
  def home
    if current_user
      redirect_to users_home_path
    else
      redirect_to new_user_session_path
    end
  end

  def checkin
    @moods = Mood.all
  end

  def checkin2
    @daily_mood = DailyMood.new(user: current_user, mood:Mood.find(params["mood"].to_i))
    @daily_mood.save
  end
end
