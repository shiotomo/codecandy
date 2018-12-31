class CodesController < ApplicationController
  before_action :authenticate_user!

  def index
    @codes = current_user.codes.all
    @results = current_user.results.all.includes(:question)
  end
end
