class Api::ApiController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  helper_method :auth_user

  # Tokenを用いた認証用メソッド
  # Tokenが有効なものもしくは、セッションが存在する場合APIを利用できる
  # 利用できない場合は{'HTTP Token': 'Access denied.'}が返却される
  private
  def authenticate_api_token
    authenticate_with_http_token do |token, options|
      @user = User.find_by(api_token: token)
    end
    # Tokenが無効な場合かつセッションが存在しない場合APIは利用できない
    render json: {'HTTP Token': 'Access denied.'} unless @user || current_user
  end

  # ユーザ情報を返却
  def auth_user
    # セッションがあるユーザの場合そのユーザを返却
    return current_user if current_user
    # Tokenでユーザを判別する場合
    authenticate_with_http_token do |token, options|
      @user = User.find_by(api_token: token)
    end
    return @user
  end
end
