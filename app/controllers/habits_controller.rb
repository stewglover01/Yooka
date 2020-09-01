class HabitsController < ApplicationController
before_action :no_banner
    def show
     @habit = Habit.find(params[:id])
     @response = Response.new
     @habit_questions = @habit.questions
    end

end
