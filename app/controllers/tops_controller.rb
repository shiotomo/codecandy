class TopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all
    # @results = Result.where(user_id: current_user.id)
    results = current_user.results
    codes =  current_user.codes

    analysis = Hash.new(0)

    results.each do |result|
      analysis[result.language] += 1
    end

    codes.each do |code|
      analysis[code.language] += 1
    end

    @analysis = analysis.sort_by{|k, v| v}.reverse
  end
end
