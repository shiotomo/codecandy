class TopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all.order(id: "asc")
    @categories = Category.all
  end
end
