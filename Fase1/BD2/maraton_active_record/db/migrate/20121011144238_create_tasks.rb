 class CreateTasks < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.timestamps
    end

    create_table :games do |t|
        t.belongs_to :deck, index: true
        t.belongs_to :user, index: true
    	t.timestamps
    end

    create_table :decks do |t|
        t.string :deck_name
        t.timestamps
    end

    create_table :cards do |t|
        t.belongs_to :deck, index: true
        t.string :question
        t.timestamps
    end

    create_table :options do |t|
        t.belongs_to :card, index: true
        t.string :option
        t.boolean :correct
        t.timestamps
    end

    create_table :game_answers do |t|
        t.belongs_to :game, index: true
        t.belongs_to :card, index: true
        t.integer :answer
    	t.integer :score
    	t.timestamps
    end
  end
end