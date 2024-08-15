class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.string :title
      t.integer :question_id  # question_idカラムを追加
      t.timestamps
    end

    add_index :results, :question_id  # インデックスを追加
  end
end
