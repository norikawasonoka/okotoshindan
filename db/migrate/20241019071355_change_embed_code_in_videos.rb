class ChangeEmbedCodeInVideos < ActiveRecord::Migration[7.1]
  def change
    change_column :videos, :embed_code, :text
  end
end
