# frozen_string_literal: true

# Represents the controller for LineLoginApi.
class LineLoginApiController < ApplicationController
  require 'json'
  require 'typhoeus'
  require 'securerandom'

  skip_before_action :require_login, only: %i[login callback]
  before_action :require_login, only: [:destroy]
  def login
    # CSRF対策用の固有な英数字の文字列
    # ログインセッションごとにWebアプリでランダムに生成する
    session[:state] = SecureRandom.urlsafe_base64

    # ユーザーに認証と認可を要求する
    # https://developers.line.biz/ja/docs/line-login/integrate-line-login/#making-an-authorization-request

    base_authorization_url = 'https://access.line.me/oauth2/v2.1/authorize'
    response_type = 'code'
    client_id = ENV['LINE_CLIENT_ID'] # 本番環境では環境変数などに保管する
    redirect_uri = CGI.escape(line_login_api_callback_url)
    state = session[:state]
    scope = 'profile%20openid' # ユーザーに付与を依頼する権限

    authorization_url = "#{base_authorization_url}?response_type=#{response_type}" \
                   "&client_id=#{client_id}&redirect_uri=#{redirect_uri}" \
                   "&state=#{state}&scope=#{scope}"

    redirect_to authorization_url, allow_other_host: true
  end

  # callbackアクション: LINEログイン後のリダイレクト先
  def callback
    # CSRF対策のトークンが一致するか確認
    if params[:state] == session[:state]
      # トークンが一致した場合、アクセストークンを取得する処理に移る
      handle_valid_state(params[:code])
    else
      # トークンが一致しない場合、不正なアクセスとしてリダイレクト
      redirect_to root_path, notice: '不正なアクセスです'
    end
  end

  # トークンが一致した場合、アクセストークンを取得
  def handle_valid_state(code)
    access_token_data = get_access_token(code)
    if access_token_data.present?
      # アクセストークンを取得できた場合、ユーザープロフィールの取得処理に移る
      access_token = access_token_data['access_token']
      handle_access_token(access_token)
    else
      # アクセストークンを取得できなかった場合、エラーメッセージを表示
      redirect_to root_path, notice: 'アクセストークンの取得に失敗しました'
    end
  end

  # アクセストークンがある場合、LINEユーザーのプロフィールを取得
  def handle_access_token(access_token)
    line_user_profile = get_line_user_profile(access_token)
    if line_user_profile.present?
      # プロフィール情報を取得できた場合、ユーザー情報の保存処理に移る
      line_user_id = line_user_profile['userId']
      user_name = line_user_profile['displayName']
      handle_user_profile(line_user_id, user_name, line_user_profile)
    else
      # プロフィール情報を取得できなかった場合、エラーメッセージを表示
      redirect_to root_path, notice: 'プロフィール情報を取得できませんでした'
    end
  end

  # ユーザー情報を保存し、ログイン状態にする
  def handle_user_profile(line_user_id, user_name, line_user_profile)
    user = User.find_or_initialize_by(line_user_id: line_user_id)
    user.name = user_name
    if user.save
      # ユーザー情報を保存できた場合、セッションにユーザーIDを格納
      session[:user_id] = user.id
      # ログイン後のリダイレクト
      redirect_to after_login_path, notice: "#{user_name}さん、ログインしました"
    else
      # ユーザー情報を保存できなかった場合、エラーメッセージを表示
      redirect_to root_path, notice: 'ログインに失敗しました'
    end
  end  

  def add_new_video_and_notify(title)
    # 新しいビデオを追加
    new_id = YoutubeVideo.data.last[:id] + 1
    YoutubeVideo.data << { id: new_id, title: title }

    # 新曲追加通知を全ユーザーに送信
    notify_all_users_about_new_song
  end

  # ログアウト処理
  def destroy
    logout
    redirect_to root_path, status: :see_other
  end

  private

  def logout
    session[:user_id] = nil
    session[:state] = nil
  end

  def get_line_user_id(code)
    # ユーザーのIDトークンからプロフィール情報（ユーザーID）を取得する
    # https://developers.line.biz/ja/docs/line-login/verify-id-token/

    line_user_id_token = get_line_user_id_token(code)

    return unless line_user_id_token.present?

    url = 'https://api.line.me/oauth2/v2.1/verify'
    options = {
      body: {
        id_token: line_user_id_token, # 修正済み
        client_id: ENV['LINE_CLIENT_ID'], # 環境変数から取得
        scope: 'profile%20openid' # 修正済み
      }
    }

    response = Typhoeus::Request.post(url, options) # ここはifの中で実行される

    return unless response.code == 200

    JSON.parse(response.body)['sub']
  end

  def get_line_user_id_token(code)
    # ユーザーのアクセストークン（IDトークン）を取得する
    # https://developers.line.biz/ja/reference/line-login/#issue-access-token

    url = 'https://api.line.me/oauth2/v2.1/token'
    redirect_uri = line_login_api_callback_url

    options = {
      headers: {
        'Content-Type' => 'application/x-www-form-urlencoded'
      },
      body: {
        grant_type: 'authorization_code',
        code:,
        redirect_uri:,
        client_id: ENV['LINE_CLIENT_ID'], # 環境変数から取得
        client_secret: ENV['LINE_CLIENT_SECRET'], # 環境変数から取得
        scope: 'profile%20openid'
      }
    }

    response = Typhoeus::Request.post(url, options)

    return unless response.code == 200

    JSON.parse(response.body)['id_token'] # ユーザー情報を含むJSONウェブトークン（JWT）
  end

  # LINEのアクセストークンを使ってユーザー情報を取得するメソッド
  def get_line_user_profile(access_token)
    url = 'https://api.line.me/v2/profile'
    response = Typhoeus.get(url, headers: { 'Authorization' => "Bearer #{access_token}" })

    if response.success?
      JSON.parse(response.body) # レスポンスのJSONを解析して返す
    else
      Rails.logger.error("LINE Profile fetch failed: #{response.code} - #{response.body}")
      nil
    end
  end

  # 認可コードを使ってアクセストークンを取得するメソッド
  def get_access_token(code)
    url = 'https://api.line.me/oauth2/v2.1/token'
    redirect_uri = line_login_api_callback_url # コールバックURLを設定

    options = {
      headers: { 'Content-Type' => 'application/x-www-form-urlencoded' },
      body: {
        grant_type: 'authorization_code',
        code:, # 認可コード
        redirect_uri:, # リダイレクトURI
        client_id: ENV['LINE_CLIENT_ID'],
        client_secret: ENV['LINE_CLIENT_SECRET']
      }
    }

    # アクセストークンを取得
    response = Typhoeus::Request.post(url, options)

    if response.code == 200
      JSON.parse(response.body) # アクセストークンのレスポンスを返す
    else
      Rails.logger.error("Failed to get access token: #{response.code} - #{response.body}")
      nil
    end
  end

  # ユーザーへの通知を送信するメソッド
  # ユーザーへの通知を送信するメソッド
  def send_line_notification(line_user_profile, message)
    url = 'https://api.line.me/v2/bot/message/push'
    
    # メッセージのデータ
    message_data = {
      to: line_user_profile['userId'], # 取得したユーザーIDを指定
      messages: [
        {
          type: 'text',
          text: message
        }
      ]
    }
    
    options = {
      headers: {
        'Authorization' => "Bearer #{ENV['LINE_CHANNEL_ACCESS_TOKEN']}", # 適切なアクセストークンを使用
        'Content-Type' => 'application/json'
      },
      body: message_data.to_json
    }

    Rails.logger.info("Sending notification with data: #{message_data}")
    Rails.logger.info("API request options: #{options}")
    
    # メッセージ送信リクエスト
    response = Typhoeus::Request.post(url, options)
    Rails.logger.info("API response: #{response.code} - #{response.body}")
    
    if response.code == 200
      Rails.logger.info("通知が正常に送信されました: #{message}")
    else
      Rails.logger.error("通知送信エラー: #{response.code} - #{response.body}")
    end
  end

  # 新曲追加通知を全ユーザーに送信するメソッド
  def notify_all_users_about_new_song
    # ユーザー全員を取得
    users = User.where.not(line_user_id: nil)

    # 各ユーザーに通知を送信
    users.each do |user|
      Rails.logger.info("Sending notification to user: #{user.line_user_id}")
      send_line_notification
    end
    Rails.logger.info 'Notification sent to all users about new song.'
  end
end
