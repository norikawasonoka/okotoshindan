class RemoveIndexFromFavorites < ActiveRecord::Migration[7.1]
  def change
    remove_index :favorites, name: "index_favorites_on_user_id_and_youtube_video_id", if_exists: true
  end
end
