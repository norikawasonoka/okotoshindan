# frozen_string_literal: true

# This migration creates the users table.
class AddNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
  end
end
