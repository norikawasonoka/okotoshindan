# frozen_string_literal: true

# This migration creates the diagnoses table.
class CreateYoutubeVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :youtube_videos do |t|
      t.string :youtube_id
      t.string :title
      t.text :description
      t.datetime :published_at
      t.integer :duration

      t.timestamps

      t.references :result, null: false, foreign_key: true
    end
  end
end
