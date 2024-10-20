# frozen_string_literal: true

# Represents the controller for Results.
class ResultsController < ApplicationController
  skip_before_action :require_login
  def index
    @results = Result.all
  end

  def new
    @result = Result.new
  end

  def show
    @result = Result.find_by(id: params[:id])
    @diagnosis = @result.diagnosis
    @youtube_embed_codes = fetch_youtube_embed_codes(@result.id)
    @youtube_videos = YoutubeVideo.where(result_id: @result.id)
    if params[:video_id].present?
      @video = Video.find(params[:video_id]) # Videoモデルから取得
      @youtube_video = @video.youtube_video # 関連付けられたYoutubeVideoを取得
    else
      # video_idがない場合の処理（エラーハンドリングやデフォルト処理）
      @youtube_video = @youtube_videos.first
    end
  end

  def create
    @diagnosis = Diagnosis.find(params[:diagnosis_id])
    @result = @diagnosis.build_result(result_params)

    if @result.save
      flash[:notice] = '結果が保存されました'
      redirect_to result_path(@result.id)
    else
      render :new
    end
  end

  private

  def result_params
    params.require(:result).permit(:title)
  end

  def fetch_youtube_embed_codes(result_id)
    YoutubeVideo.where(result_id:)
  end

  # current_userメソッドが定義されていない場合は以下を追加
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
