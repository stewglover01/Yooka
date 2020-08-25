class PagesController < ApplicationController
  def home
  end

  def checkin
    @moods = Mood.all
  end

  def checkin2
    @daily_mood = DailyMood.new(user: current_user, mood:Mood.find(params["mood"].to_i))
    @daily_mood.save
  end
end
