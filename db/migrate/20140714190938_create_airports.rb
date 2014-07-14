class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
    	t.string :name
    	t.integer :carrier_id
    	t.integer :trip_id
    	t.integer :flight_id
    	t.string :city
    	t.string :state

      t.timestamps
    end
  end
end
