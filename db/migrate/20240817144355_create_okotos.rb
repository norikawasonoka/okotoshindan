class CreateOkotos < ActiveRecord::Migration[7.1]
  def change
    create_table :okotos do |t|

      t.timestamps
    end
  end
end
