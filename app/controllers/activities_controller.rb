class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])
  end
end
