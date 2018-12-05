class LessonsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.page(params[:page]).order(created_at: "desc")
  end

  def show
    @question = Question.friendly.find(params[:id])
    answer = @question.answers.order(created_at: 'asc').first

    if answer.nil?
      @input = ""
      @output = ""
    else
      @input = answer.input
      @output = answer.output
    end

    # code golf ranking
    results = @question.results

    results.each do |result|
      # 答えがfalseであれば次の解答を見る
      next unless result.answer
      @code_golf_top_code = result if @code_golf_top_code.nil?
      @code_golf_top_code = result if @code_golf_top_code.code.length > result.code.length
    end
    puts @code_golf_top_code.nil?
  end
end
