class AddDiagnosisIdToResults < ActiveRecord::Migration[7.1]
  def change
    add_reference :results, :diagnosis, null: false, foreign_key: true
  end
end
