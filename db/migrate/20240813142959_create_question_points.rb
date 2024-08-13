class CreateQuestionPoints < ActiveRecord::Migration[7.1]
  def change
    create_table :question_points do |t|
      t.boolean :answer, null: false
      t.integer :point, null: false

      t.references :question, null: false, foreign_key: true
      t.references :result, null: false, foreign_key: true

      t.timestamps
    end
  end
end
