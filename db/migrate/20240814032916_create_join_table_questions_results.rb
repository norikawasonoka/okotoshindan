class CreateJoinTableQuestionsResults < ActiveRecord::Migration[7.1]
  def change
    create_join_table :questions, :results do |t|
      t.index [:question_id, :result_id]
      t.index [:result_id, :question_id]
    end
  end
end
