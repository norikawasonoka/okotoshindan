# frozen_string_literal: true

# Migration for chainging favorite table
class AddResultIdToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_column :favorites, :result_id, :integer
  end
end
