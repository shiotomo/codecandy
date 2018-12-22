require './lib/code_candy/analysis'

class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :all_questions, only: [:index, :show]
  before_action :set_questions, only: [:answer, :list]

  def index
    @users = User.all.order(created_at: 'asc')
    @categories = Category.all.order(created_at: 'asc')
    @results = Result.all.order(created_at: 'desc')
    @codes = Code.all.order(created_at: 'desc')
    analysis_results = CodeCandy::Analysis.statistics_result(@results)
    analysis_codes = CodeCandy::Analysis.statistics_result(@codes)
    analysis = analysis_results.merge(analysis_codes){|k, v1, v2| v1 + v2}
    @analysis = analysis.sort_by{|k, v| v}.reverse
  end

  def show
    @user = User.friendly.find(params[:id])
    @results = @user.results.all.order(created_at: 'asc')
    @codes = @user.codes.all.order(created_at: 'asc')
    analysis_results = CodeCandy::Analysis.statistics_result(@results)
    analysis_codes = CodeCandy::Analysis.statistics_result(@codes)
    analysis = analysis_results.merge(analysis_codes){|k, v1, v2| v1 + v2}
    @analysis = analysis.sort_by{|k, v| v}.reverse
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
