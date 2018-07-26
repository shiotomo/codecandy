class TopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @results = Result.where(user_id: current_user.id)

    @analysis = Hash.new(0)
    @results.each do |result|
      @analysis[result.language] += 1
    end
  end
end
