class CodeGolfRankingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all
  end

  def show
  end
end
