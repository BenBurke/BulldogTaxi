class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
    	t.string :flight_number
    	t.integer :carrier_id
    	t.string :departure_airport
    	t.integer :departure_airport_id
    	t.string :arrival_airport
    	t.integer :arrival_airport_id


      t.timestamps
    end
  end
end
