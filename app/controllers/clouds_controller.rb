class CloudsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def generate_token
    current_user.regenerate_api_token
    flash[:create_token] = "Successful create token!!"
    redirect_to clouds_path
  end
end
