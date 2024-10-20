# frozen_string_literal: true

# Represents the controller for Videos.
# app/controllers/videos_controller.rb
class VideosController < ApplicationController
  def create
    youtube_video = YoutubeVideo.find(params[:youtube_video_id]) # YoutubeVideoを取得
    video_params = params.require(:video).permit(:title, :embed_code) # 必要なパラメータを許可
    create_video_with_youtube(video_params, youtube_video) # カスタムメソッドで作成

    redirect_to video_path(video) # 作成後にリダイレクト
  end

  private

  # カスタムメソッド
  def create_video_with_youtube(video_params, youtube_video)
    video = Video.new(video_params)
    video.youtube_video = youtube_video
    if video.save
      flash[:notice] = "Video successfully created"
    else
      flash[:alert] = "Failed to create video"
    end
  end
end
