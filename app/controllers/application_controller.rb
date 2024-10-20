# frozen_string_literal: true

# ApplicationController
# This controller handles authentication and ensures that users are logged in
# before accessing certain actions.

class ApplicationController < ActionController::Base
  before_action :require_login # ログインが必要なアクションの前に require_login を呼び出す
  helper_method :logged_in? # ビューで呼び出せるように helper_method で指定
  helper_method :current_user

  private

  # ログインしていない場合にログインページにリダイレクトする
  def require_login
    return if logged_in?

    redirect_to root_path, alert: 'ログインしてください'
  end

  # 現在のユーザーがログインしているか確認する
  def logged_in?
    !!session[:user_id] # user_id がセッションに存在すればログインしているとみなす
  end

  def current_user
    # ここにユーザーを取得するロジックを記述する
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
