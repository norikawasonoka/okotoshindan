# frozen_string_literal: true

# This migration creates the diagnoses table.
class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.string :title

      t.timestamps
    end
  end
end
