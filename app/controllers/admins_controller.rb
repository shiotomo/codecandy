class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def index
    @users = User.all.order(created_at: 'asc')
    @questions = Question.all
  end

  def show
    @user = User.find(params[:id])
  end
end
