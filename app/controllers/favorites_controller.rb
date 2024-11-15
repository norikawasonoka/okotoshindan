# frozen_string_literal: true

# Represents the controller for Favorites.
class FavoritesController < ApplicationController
  before_action :require_login

  def create
    @video = Video.find(params[:video_id])
    @result = @video.result
    @favorite = current_user.favorites.find_or_initialize_by(video: @video)
    @favorite.result_id = @result.id

    if @favorite.save
      respond_to :turbo_stream
    else
      respond_to do |format|
        format.html { redirect_to @result, alert: 'Failed to favorite.' }
      end
    end
  end

  def destroy
    @video = Video.find(params[:video_id])
    @result = @video.result
    @favorite = current_user.favorites.find_by(video: @video)

    if @favorite.destroy
      respond_to :turbo_stream
    else
      respond_to do |format|
        format.html { redirect_to @result, alert: 'Failed to unfavorite.' }
      end
    end
  end
end
