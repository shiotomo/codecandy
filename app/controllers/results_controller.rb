class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:show, :code]

  def index
    @questions = Question.all
    @results = Result.where(user_id: current_user.id)

    @analysis = Hash.new(0)
    @results.each do |result|
      @analysis[result.language] += 1
    end
  end

  def show
    @results = @question.results.where(user_id: current_user.id)
  end

  def code
    @result = @question.results.find(params[:result_id])

    redirect_to question_path(@question) unless @result.user_id == current_user.id

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

  def set_question
    @question = Question.friendly.find(params[:id])
  end
end
