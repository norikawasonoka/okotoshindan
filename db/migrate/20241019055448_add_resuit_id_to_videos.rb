# frozen_string_literal: true

# Migration for changing videos table
class AddResuitIdToVideos < ActiveRecord::Migration[7.1]
  def change
    add_column :videos, :result_id, :string
  end
end
