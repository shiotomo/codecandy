class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :sign_in?

  private
  # ログインしているユーザの情報を提示するメソッド
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # サインインしているかどうかを確認するメソッド
  def user_signed_in?
    if session[:user_id]
      return true
    else
      return false
    end
  end

  # アクセス制限に利用するメソッド
  def authenticate_user!
    user = User.find_by_id(session[:user_id])

    unless user
      redirect_to root_path
    end
  end
end
