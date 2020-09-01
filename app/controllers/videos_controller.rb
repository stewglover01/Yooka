class VideosController < ApplicationController
  before_action :no_banner

  def show
    @video = Video.find(params[:id])
  end

def rewards
  @video = Video.find(params[:id])

  #marking video as watched
  journey_lesson = @video.lesson.journey_lessons.find { |jl| jl.journey.user_id == current_user.id }
  journey_lesson.video_watched = true
  journey_lesson.save!

  # assigning XP and badges
  @badgesearned = []
  current_user.xp += @video.xp
  current_user.save

  if current_user.xp >= 10
    @badge = Badge.find_by(name:"hot streak")
    badgeuser = BadgeUser.new(user: current_user, badge: @badge)
    badgeuser.save
    @badgesearned << badgeuser
  end
  if current_user.xp >= 25
    @badge = Badge.find_by(name:"sleep master")
    badgeuser = BadgeUser.new(user: current_user, badge: @badge)
    badgeuser.save
    @badgesearned << badgeuser
  end
  if current_user.xp >= 50
    @badge = Badge.find_by(name:"mindfulness guru")
    badgeuser = BadgeUser.new(user: current_user, badge: @badge)
    badgeuser.save
    @badgesearned << badgeuser
  end
  if current_user.xp >= 75
    @badge = Badge.find_by(name:"sleep master")
    badgeuser = BadgeUser.new(user: current_user, badge: @badge)
    badgeuser.save
    @badgesearned << badgeuser
  end
  if current_user.xp >= 100
    @badge = Badge.find_by(name:"stress buster")
    badgeuser = BadgeUser.new(user: current_user, badge: @badge)
    badgeuser.save
    @badgesearned << badgeuser
  end
  if current_user.xp >= 125
    @badge = Badge.find_by(name:"mentor")
    badgeuser = BadgeUser.new(user: current_user, badge: @badge)
    badgeuser.save
    @badgesearned << badgeuser
  end





end


end
