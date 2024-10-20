# frozen_string_literal: true

# Represents the controller for Favorites.
class FavoritesController < ApplicationController
  before_action :require_login

  def create
    @video = Video.find(params[:video_id])
    @favorite = current_user.favorites.find_or_initialize_by(video: @video)
  
    if @favorite.new_record?
      @favorite.save
    else
      flash[:notice] = "この動画はすでにお気に入りに追加されています。"
    end
  
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js  # create.js.erbを呼び出す
    end
  end

  def destroy
    @video = Video.find(params[:video_id])
    @favorite = current_user.favorites.find_or_initialize_by(video: @video)

    if @favorite
      @favorite.destroy
    else
      flash[:error] = "お気に入りが見つかりませんでした。"
    end

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.js  # destroy.js.erbを呼び出す
    end
  end
end
