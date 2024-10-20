class AddVideoIdToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_column :favorites, :video_id, :integer
  end
end
