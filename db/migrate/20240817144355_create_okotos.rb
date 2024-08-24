# frozen_string_literal: true

# This migration creates the diagnoses table.
class CreateOkotos < ActiveRecord::Migration[7.1]
  def change
    create_table :okotos, &:timestamps
  end
end
