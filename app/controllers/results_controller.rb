class ResultsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @results= @question.results.where(user_id: current_user.id)
  end
end
