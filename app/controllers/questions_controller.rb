require './lib/bot'

class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # def index
  #   @questions = Question.all
  # end

  def show
    @answers = @question.answers.order(created_at: 'asc')
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      Bot.tweet(params[:question][:title])
      redirect_to @question
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admins_path
  end

  private
  def set_question
    @question = Question.friendly.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :body, answers_attributes: [:id, :input, :output, :_destroy])
  end
end
