class CreateTags < ActiveRecord::Migration[4.2]
  def change
  	create_table :tags do |t|
  		t.string :tag
  		t.timestamps
  	end
  end
end