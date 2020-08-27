class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
    @responses = @activity.responses.where(user: current_user)
    @unanswered_questions = @activity.questions - @responses.map { |r| r.question}
    @response = Response.new
    @badgesearned = []
    @journeys = current_user.journeys
    
    if @unanswered_questions.empty?
      current_user.xp += @activity.xp
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
