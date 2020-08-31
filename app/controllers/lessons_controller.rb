class LessonsController < ApplicationController
  before_action :blue_banner

  def show
    @lesson = Lesson.find(params[:id])
  end
end
