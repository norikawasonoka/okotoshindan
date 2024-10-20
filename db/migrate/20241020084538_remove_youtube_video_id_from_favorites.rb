class RemoveYoutubeVideoIdFromFavorites < ActiveRecord::Migration[7.1]
  def change
    remove_column :favorites, :youtube_video_id, :string
  end
end
