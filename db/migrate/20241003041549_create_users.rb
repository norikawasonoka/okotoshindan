# frozen_string_literal: true

# Migration for creating users table
class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      # 追加
      t.string :line_user_id, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
