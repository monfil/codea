class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
    	t.belongs_to :deck, index: true
    	t.string :question
    	
      t.timestamps
    end
  end
end
