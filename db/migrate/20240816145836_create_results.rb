class CreateResults < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.string :title

      t.timestamps
    end
  end
end
