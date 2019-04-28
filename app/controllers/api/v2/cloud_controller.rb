class Api::V2::CloudController < Api::ApiController
  before_action :authenticate_api_token

  def status
    state = {
      "status": "Active",
    }
    render json: state
  end
end
