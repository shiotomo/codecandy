class WelcomesController < ApplicationController
  def index
    redirect_to lessons_path if user_signed_in?
  end
end
