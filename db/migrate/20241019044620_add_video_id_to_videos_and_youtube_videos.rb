class AddVideoIdToVideosAndYoutubeVideos < ActiveRecord::Migration[7.1]
  def change
    add_column :videos, :video_id, :string
    add_column :youtube_videos, :video_id, :string
  end
end
