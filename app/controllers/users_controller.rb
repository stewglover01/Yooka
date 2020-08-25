class UsersController < ApplicationController
  def home
    @journeys = current_user.journeys
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
