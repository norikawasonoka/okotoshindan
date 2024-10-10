# frozen_string_literal: true

# Represents the controller for LineWebhooks.
class LineWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token # CSRF対策をスキップ
  skip_before_action :require_login, only: [:callback]

  # LINEからのWebhookイベントを受け取るアクション
  def callback
    # 受信したWebhookイベントをログに出力
    logger.info '### Received Webhook Event ###'
    logger.info "Event Params: #{params.inspect}"

    # リクエストボディの内容を取得
    body = request.body.read
    events = JSON.parse(body)['events'] # events はLINEから送られてくるイベント

    # イベントごとに処理
    events.each do |event|
      # メッセージイベントを受信したとき
      next unless event['type'] == 'message'

      user_id = event['source']['userId']
      message = event['message']['text']

      # LINE Botの管理者のIDからのメッセージかどうかを判定
      if user_id == ENV['LINE_ADMIN_USER_ID']
        # 管理者から「新曲追加」メッセージが送信された場合
        notify_all_users_about_new_song if message.include?('新曲追加')
      else
        # それ以外のユーザーのメッセージに対して通常の返信
        send_line_message(user_id, "こんにちは！あなたのメッセージは「#{message}」です。")
      end
    end

    render json: { status: 'ok' }, status: :ok
  end

  private

  # LINEにメッセージを送信するメソッド
  def send_line_message(user_id, message)
    url = 'https://api.line.me/v2/bot/message/push'
    access_token = ENV['LINE_BOT_CHANNEL_ACCESS_TOKEN']

    message_data = {
      to: user_id,
      messages: [
        {
          type: 'text',
          text: message
        }
      ]
    }

    options = {
      headers: {
        'Authorization' => "Bearer #{access_token}",
        'Content-Type' => 'application/json'
      },
      body: message_data.to_json
    }

    # メッセージ送信リクエスト
    response = Typhoeus::Request.post(url, options)

    if response.code == 200
      Rails.logger.info "Message sent successfully to user: #{user_id}"
    else
      Rails.logger.error "Failed to send message: #{response.code} - #{response.body}"
    end
  end

  # 新曲追加通知を全ユーザーに送信するメソッド
  def notify_all_users_about_new_song
    # ユーザー全員を取得
    users = User.where.not(line_user_id: nil)
  
    # 各ユーザーに通知を送信
    users.each do |user|
      # ユーザーIDを正しく取得して渡す
      send_line_notification({ 'userId' => user.line_user_id }, '新曲が追加されました！ぜひチェックしてみてください。')
    end
    Rails.logger.info 'Notification sent to all users about new song.'
  end
end
