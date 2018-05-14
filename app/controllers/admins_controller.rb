class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :all_questions, only: [:index, :show]

  def index
    @users = User.all.order(created_at: 'asc')
    @categories = Category.all.order(created_at: 'asc')
  end

  def show
    @user = User.find(params[:id])
  end

  def answer
    @question = Question.find(params[:id])
    @user = User.find(params[:user_id])
    @results = @question.results.where(user_id: params[:user_id])
  end

  private
  def all_questions
    @questions = Question.all
  end
end
