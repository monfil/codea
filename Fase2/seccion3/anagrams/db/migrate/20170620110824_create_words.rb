class CreateWords < ActiveRecord::Migration[4.2]
  def change
    create_table :words do |t|
      t.string :word
      t.string :canonical
      t.timestamps
    end
  end
end
