class ChangingFlightNumberToId < ActiveRecord::Migration
  def change
  	remove_column :trips, :flight_number
  	add_column :trips, :flight_id, :integer
  end
end
