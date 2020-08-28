class VideosController < ApplicationController
  before_action :no_banner

  def show
    @video = Video.find(params[:id])
  end
end
