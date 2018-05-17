class TopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all.order(created_at: "asc")
    @categories = Category.all.order(created_at: 'asc')
  end
end
