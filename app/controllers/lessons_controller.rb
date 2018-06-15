class LessonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.page(params[:page]).order(created_at: "asc")
  end

  def show
    @question = Question.friendly.find(params[:id])
    answer = @question.answers.order(created_at: 'asc').first
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
