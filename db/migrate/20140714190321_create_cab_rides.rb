class CreateCabRides < ActiveRecord::Migration
  def change
    create_table :cab_rides do |t|
    	t.integer :trip_id

      t.timestamps
    end
  end
end
