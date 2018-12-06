require './lib/code_candy/parameter'

class CodeGolfRankingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @results = @question.results

    # ランキングを格納するハッシュ
    @ranking_hash = {}

    # ランキングを格納(尚、使われていない言語のランキングは出てこない)
    @results.each do |result|
      next unless result.answer
      @ranking_hash[:"#{result.language}"] = result unless @ranking_hash.has_key?(:"#{result.language}")
      @ranking_hash[:"#{result.language}"] = result if @ranking_hash[:"#{result.language}"].code.length > result.code.length
    end
  end
end
