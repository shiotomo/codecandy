class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:show, :code]

  def show
    @results = @question.results.where(user_id: current_user.id).order(created_at: 'desc')
  end

  def set_question
    @question = Question.friendly.find(params[:id])
  end
end
