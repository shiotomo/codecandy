class ResultsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @results = @question.results.where(user_id: current_user.id)
  end

  def code
    @question = Question.find(params[:id])
    @result = @question.results.find(params[:id])
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
