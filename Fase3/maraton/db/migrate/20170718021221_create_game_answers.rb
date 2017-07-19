class CreateGameAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :game_answers do |t|
    	t.belongs_to :game, index: true
    	t.belongs_to :card, index: true
    	t.integer :answer
    	t.integer :score

      t.timestamps
    end
  end
end
