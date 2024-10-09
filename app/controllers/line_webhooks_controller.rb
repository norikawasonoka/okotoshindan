class LineWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token  # CSRF対策をスキップ
  skip_before_action :require_login, only: [:callback]

  # LINEからのWebhookイベントを受け取るアクション
  def callback
     # 受信したWebhookイベントをログに出力
    logger.info "### Received Webhook Event ###"
    logger.info "Event Params: #{params.inspect}"
    # リクエストボディの内容を取得
    body = request.body.read
    events = JSON.parse(body)['events']  # events はLINEから送られてくるイベント

    # イベントごとに処理
    events.each do |event|
      logger.info "Event type: #{event['type']}"
      case event['type']
      when 'unfollow'
        logger.info "User unfollowed the bot: #{event['source']['userId']}"
      when 'follow'
        logger.info "User followed the bot: #{event['source']['userId']}"
      else
        logger.info "Received another event type: #{event['type']}"
      end

      # ここにイベント処理のロジックを書く。例えばメッセージを返信するなど。
      if event['type'] == 'message'
        user_id = event['source']['userId']
        message = event['message']['text']

        Rails.logger.info "Received message from user: #{user_id} with message: #{message}"

        # 返信メッセージを送信する処理
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
end
