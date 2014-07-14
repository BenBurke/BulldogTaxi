class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    	t.string :flight_number
    	t.integer :cab_ride_id
    	t.integer :user_id

      t.timestamps
    end
    add_index :trips, :cab_ride_id
    add_index :trips, :user_id
  end
end
