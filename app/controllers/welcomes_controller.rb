class WelcomesController < ApplicationController
  def index
    redirect_to tops_path if user_signed_in?
  end
end
