class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      # 追加のカラム
      t.integer :score_range_start, null: false
      t.integer :score_range_end, null: false
      t.text :description, null: false
      t.string :title, null: false
      
      # 新しいカラム
      t.integer :question_id
      t.timestamps
    end

    # インデックス追加
    add_index :results, :question_id
  end
end
