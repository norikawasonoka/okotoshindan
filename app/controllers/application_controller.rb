# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login  # ログインが必要なアクションの前に require_login を呼び出す
  helper_method :logged_in? #ビューで呼び出せるように helper_method で指定

  private

  # ログインしていない場合にログインページにリダイレクトする
  def require_login
    unless logged_in?
      redirect_to root_path, alert: 'ログインしてください'
    end
  end

  # 現在のユーザーがログインしているか確認する
  def logged_in?
    !!session[:user_id]  # user_id がセッションに存在すればログインしているとみなす
  end
end
