class CreateGrandmas < ActiveRecord::Migration[5.1]
  def change
    create_table :grandmas do |t|

      t.timestamps
    end
  end
end
