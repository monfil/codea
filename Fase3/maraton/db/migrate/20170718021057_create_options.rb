class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
    	t.belongs_to :card, index: true
    	t.string :option
    	t.boolean :correct

      t.timestamps
    end
  end
end
