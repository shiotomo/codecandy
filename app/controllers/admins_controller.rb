class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :all_questions, only: [:index, :show]
  before_action :set_questions, only: [:answer, :list]

  def index
    @users = User.all.order(created_at: 'asc')
    @categories = Category.all.order(created_at: 'asc')
    @results = Result.all.limit(30).order(created_at: 'desc')
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def answer
    @user = User.friendly.find(params[:user_id])
    @results = @question.results.where(user_id: params[:user_id])
  end

  def list
    @results = @question.results.all.order(created_at: 'desc')
  end

  private
  def set_questions
    @question = Question.friendly.find(params[:id])
  end

  def all_questions
    @questions = Question.all.order(created_at: 'asc')
  end
end
