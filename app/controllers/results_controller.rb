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
    YoutubeVideo.where(result_id: result_id)
  end
end

