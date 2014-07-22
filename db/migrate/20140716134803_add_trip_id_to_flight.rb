class AddTripIdToFlight < ActiveRecord::Migration
  def change
  	add_column :flights, :trip_id, :integer
  	add_index :flights, :trip_id
  end
end
