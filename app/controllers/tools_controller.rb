class ToolsController < ApplicationController

 def show
    @tool = Tool.find(params[:id])
 end

end
