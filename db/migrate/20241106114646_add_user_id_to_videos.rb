# frozen_string_literal: true

# Migration for chainging videos table
class AddUserIdToVideos < ActiveRecord::Migration[7.1]
  def change
    add_column :videos, :user_id, :bigint
  end
end
