class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?

  private
  # ログインしているユーザの情報を提示するメソッド
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # サインインしているかどうかを確認するメソッド
  def user_signed_in?
    return true if session[:user_id]
    return false
  end

  # アクセス制限に利用するメソッド
  def authenticate_user!
    redirect_to root_path unless User.find_by_id(session[:user_id])
  end

  # adminユーザかを判断するメソッド
  def authenticate_admin!
    redirect_back(fallback_location: root_path) unless current_user.is_admin
  end
end
