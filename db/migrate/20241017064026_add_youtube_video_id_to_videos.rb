# frozen_string_literal: true

# Migration for changing videos table
class AddYoutubeVideoIdToVideos < ActiveRecord::Migration[7.1]
  def change
    add_column :videos, :youtube_video_id, :integer
  end
end
