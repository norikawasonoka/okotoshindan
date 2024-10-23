class AddResultIdToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_column :favorites, :result_id, :integer
  end
end
