class Api::V2::CloudController < Api::ApiController
  before_action :authenticate_api_token

  def get_token
    state = {
      "token": "Active"
    }
    render json: state
  end

  def generate_token
    user = current_user
    user.regenerate_api_token
    redirect_to clouds_path
  end
end
