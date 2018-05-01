class LessonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all.order(id: "asc")
  end

  def show
    @question = Question.find(params[:id])
    answer = @question.answers.order(created_at: 'asc').first
    puts "================"
    p answer
    puts "================"
    if answer.nil?
      @input = ""
    else
      @input = answer.input
    end
    if answer.nil?
      @output = ""
    else
      @output = answer.output
    end
  end
end
