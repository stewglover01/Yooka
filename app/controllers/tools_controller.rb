class ToolsController < ApplicationController
  before_action :cream_banner

  def show
    @tool = Tool.find(params[:id])
  end

end
