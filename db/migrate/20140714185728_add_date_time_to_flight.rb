class AddDateTimeToFlight < ActiveRecord::Migration
  def change
  	add_column :flights, :arrival_datetime, :datetime
  	add_column :flights, :departure_datetime, :datetime
  end
end
