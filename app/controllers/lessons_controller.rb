class LessonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all.order(id: "asc")
  end

  def show
    @question = Question.find(params[:id])
  end
end
