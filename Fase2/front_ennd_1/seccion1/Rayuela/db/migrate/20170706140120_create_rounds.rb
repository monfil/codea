class CreateRounds < ActiveRecord::Migration[4.2]
  def change
  	create_table :rounds do |t|
  		t.belongs_to :player, index: true
  		t.belongs_to :game, index: true
  		t.integer :score
  		t.timestamps
  	end
  end
end
