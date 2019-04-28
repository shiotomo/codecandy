class Api::ApiController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  # Tokenを用いた認証用メソッド
  private
  def authenticate_api_token
    authenticate_with_http_token do |token, options|
      @user = User.find_by(api_token: token)
    end
    render json: {'HTTP Token': 'Access denied.'} unless @user
  end
end
