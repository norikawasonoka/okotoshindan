# frozen_string_literal: true

# Migration for creating videos table
class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :embed_code

      t.timestamps
    end
  end
end
