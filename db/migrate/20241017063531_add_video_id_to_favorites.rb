# frozen_string_literal: true

# Migration for creating videos table
class AddVideoIdToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_column :favorites, :video_id, :integer
  end
end
