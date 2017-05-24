class CreateTasks < ActiveRecord::Migration[4.2]
  def change
    create_table :tasks do |t|
      # Completa con las columnas que necesites
      t.string :tasks
      t.boolean :done
    end
  end
end
