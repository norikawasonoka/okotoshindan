# frozen_string_literal: true

# This migration creates the diagnoses table.
class CreateDiagnoses < ActiveRecord::Migration[7.1]
  def change
    create_table :diagnoses do |t|
      t.string :title

      t.timestamps
    end
  end
end
