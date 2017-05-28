class CreateTasks < ActiveRecord::Migration[4.2]
  def change
    create_table :tasks do |t|
      # Completa con las columnas que necesites
      t.string :task
      t.boolean :done, default: false
      t.timestamps
    end
  end
end
