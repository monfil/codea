class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.timestamps
    end

    create_table :questions do |t|
    	t.string :question
    	t.timestamps
    end

    create_table :cards do |t|
    	t.timestamps
    end

    create_table :options do |t|
    	t.timestamps
    end

    create_table :decks do |t|
    	t.string :deck_names
    	t.timestamps
    end

    create_table :deck_cards do |t|
    	t.timestamps
    end

    create_table :games do |t|
    	t.timestamps
    end

    create_table :game_answers do |t|
    	t.integer :score
    	t.timestamps
    end

  end
end