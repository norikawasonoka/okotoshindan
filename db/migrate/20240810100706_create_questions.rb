class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :question_type, default: 0, null: false  # question_typeカラムの追加
      t.timestamps
    end
  end
end
