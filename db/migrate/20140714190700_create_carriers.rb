class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
    	t.string :name
    	t.integer :airport_id

      t.timestamps
    end
  end
end
