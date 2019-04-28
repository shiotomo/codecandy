class CloudsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def generate_token
    user = User.find(params[:user_id])
    user.regenerate_api_token
    redirect_to clouds_path
  end
end
