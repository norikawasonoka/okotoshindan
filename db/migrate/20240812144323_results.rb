class Results < ActiveRecord::Migration[7.1]
  def change
    create_table :results do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
